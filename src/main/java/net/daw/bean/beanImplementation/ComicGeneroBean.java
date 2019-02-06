/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.bean.beanImplementation;

import com.google.gson.annotations.Expose;
import java.sql.Connection;
import java.sql.ResultSet;
import net.daw.bean.genericBeanImplementation.GenericBeanImplementation;
import net.daw.bean.publicBeanInterface.BeanInterface;
import net.daw.dao.publicDaoInterface.DaoInterface;
import net.daw.factory.DaoFactory;

/**
 *
 * @author kevin
 */
public class ComicGeneroBean extends GenericBeanImplementation implements BeanInterface {

    @Expose(serialize = false)
    private int id_genero;
    @Expose(serialize = false)
    private int id_comic;

    @Expose(deserialize = false)
    private GeneroBean obj_genero;

    @Expose(deserialize = false)
    private ComicBean obj_comic;

    public int getId_genero() {
        return id_genero;
    }

    public void setId_genero(int id_genero) {
        this.id_genero = id_genero;
    }

    public int getId_comic() {
        return id_comic;
    }

    public void setId_comic(int id_comic) {
        this.id_comic = id_comic;
    }

    public GeneroBean getObj_genero() {
        return obj_genero;
    }

    public void setObj_genero(GeneroBean obj_genero) {
        this.obj_genero = obj_genero;
    }

    public ComicBean getObj_comic() {
        return obj_comic;
    }

    public void setObj_comic(ComicBean obj_comic) {
        this.obj_comic = obj_comic;
    }

    @Override
    public ComicGeneroBean fill(ResultSet oResultSet, Connection oConnection, Integer expand, UsuarioBean oUsuarioBeanSession) throws Exception, Exception {
        this.setId(oResultSet.getInt("id"));

        if (expand > 0) {
            DaoInterface ocomicDao = DaoFactory.getDao(oConnection, "comic", oUsuarioBeanSession);
            this.setObj_comic((ComicBean) ocomicDao.get(oResultSet.getInt("id_comic"), expand - 1));
        } else {
            this.setId_comic(oResultSet.getInt("id_comic"));
        }

        if (expand > 0) {
            DaoInterface ogeneroDao = DaoFactory.getDao(oConnection, "genero", oUsuarioBeanSession);
            this.setObj_genero((GeneroBean) ogeneroDao.get(oResultSet.getInt("id_genero"), expand - 1));
        } else {
            this.setId_genero(oResultSet.getInt("id_genero"));
        }

        return this;
    }

    @Override
    public String getColumns() {
        String strColumns = "";
        strColumns += "id,";
        strColumns += "id_genero,";
        strColumns += "id_comic";

        return strColumns;
    }

    @Override
    public String getValues() {
        String strColumns = "";
        strColumns += "null,";
        strColumns += id_genero + ",";
        strColumns += id_comic;

        return strColumns;
    }

    @Override
    public String getPairs() {
        String strPairs = "";
        strPairs += "id=" + id + ",";
        strPairs += "id_genero=" + id_genero + ",";
        strPairs += "id_comic=" + id_comic;
        strPairs += " WHERE id=" + id;

        return strPairs;
    }

}
