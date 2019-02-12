/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.dao.daoImplementation_1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import net.daw.bean.beanImplementation.AutorBean;
import net.daw.bean.beanImplementation.EspecialidadBean;
import net.daw.bean.beanImplementation.UsuarioBean;
import net.daw.bean.publicBeanInterface.BeanInterface;
import net.daw.dao.genericDaoImplementation.GenericDaoImplementation;
import net.daw.dao.publicDaoInterface.DaoInterface;
import net.daw.factory.BeanFactory;
import net.daw.helper.SqlBuilder;

/**
 *
 * @author a044531896d
 */
public class AutorDao_1 extends GenericDaoImplementation implements DaoInterface {

    public AutorDao_1(Connection oConnection, String ob, UsuarioBean oUsuarioBeanSession) {
        super(oConnection, ob, oUsuarioBeanSession);
    }

    public ArrayList<?> getpageAutorEspecialidad(int id, int iRpp, int iPage, HashMap<String, String> hmOrder, Integer expand) throws Exception {
        String strSQL = "";
        strSQL += "SELECT a.id, a.nombre, e.id , e.desc "
                + "FROM comic c, autorespecialidad ae, autor a, especialidad e "
                + "WHERE c.id = ae.id_comic AND "
                + "a.id = ae.id_autor AND "
                + "e.id = ae.id_especialidad AND "
                + "c.id = " + id + " GROUP BY a.id, e.id";
        strSQL += SqlBuilder.buildSqlOrder(hmOrder);

        ArrayList<Object> alBean;
        ArrayList<Object> aEspAutBean = new ArrayList<>();
        ArrayList<BeanInterface> aEspBean;
        AutorBean autorAux = null;
        if (iRpp > 0 && iRpp < 100000 && iPage > 0 && iPage < 100000000) {
            strSQL += " LIMIT " + (iPage - 1) * iRpp + ", " + iRpp;
            ResultSet oResultSet = null;
            PreparedStatement oPreparedStatement = null;
            try {
                oPreparedStatement = oConnection.prepareStatement(strSQL);
                oResultSet = oPreparedStatement.executeQuery();
                alBean = new ArrayList<>();
                while (oResultSet.next()) {

                    aEspBean = new ArrayList<>();
                    EspecialidadBean especialidadAux = new EspecialidadBean();
                    AutorBean oBeanAutor = new AutorBean();
                    EspecialidadBean oBeanEspecialidad = new EspecialidadBean();
                    oBeanEspecialidad.setId(oResultSet.getInt("e.id"));
                    oBeanEspecialidad.setDesc(oResultSet.getString("e.desc"));
                    oBeanAutor.fill(oResultSet, oConnection, expand, oUsuarioBeanSession);
                    if (autorAux == null) {
                        autorAux = oBeanAutor;
                        aEspAutBean.add(oBeanAutor);
                    }
                    int id1 = autorAux.getId();
                    int id2 = oBeanAutor.getId();
                    if (id1!=id2) {
                        aEspAutBean.add(aEspBean);
                        alBean.add(aEspAutBean);
                        autorAux = oBeanAutor;
                        aEspAutBean = new ArrayList<>();
                        aEspBean = new ArrayList<>();
                        aEspAutBean.add(oBeanAutor);
                        aEspBean.add(oBeanEspecialidad);
                    } else {
                        aEspBean.add(oBeanEspecialidad);
                    }

                    if (oResultSet.isLast()) {
                        aEspAutBean.add(aEspBean);
                        alBean.add(aEspAutBean);
                    }

                }
            } catch (SQLException e) {
                throw new Exception("Error en Dao getpage de " + ob, e);
            } finally {
                if (oResultSet != null) {
                    oResultSet.close();
                }
                if (oPreparedStatement != null) {
                    oPreparedStatement.close();
                }
            }
        } else {
            throw new Exception("Error en Dao getpage de " + ob);
        }
        return alBean;
    }

}
