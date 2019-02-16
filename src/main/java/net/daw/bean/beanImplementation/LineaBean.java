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
 * @author a044531896d
 */
public class LineaBean extends GenericBeanImplementation implements BeanInterface {

    @Expose
    private int cantidad;

    @Expose(serialize = false)
    private int id_comic;

    @Expose(serialize = false)
    private int id_factura;

    @Expose(deserialize = false)
    private ComicBean obj_Comic;

    @Expose(deserialize = false)
    private FacturaBean obj_Factura;

    public ComicBean getObj_Comic() {
        return obj_Comic;
    }

    public void setObj_Comic(ComicBean Obj_Comic) {
        this.obj_Comic = Obj_Comic;
    }

    public FacturaBean getObj_Factura() {
        return obj_Factura;
    }

    public void setObj_Factura(FacturaBean obj_Factura) {
        this.obj_Factura = obj_Factura;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getId_comic() {
        return id_comic;
    }

    public void setId_comic(int id_comic) {
        this.id_comic = id_comic;
    }

    public int getId_factura() {
        return id_factura;
    }

    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    @Override
    public LineaBean fill(ResultSet oResultSet, Connection oConnection, Integer expand, UsuarioBean oUsuarioBeanSession) throws Exception {

        this.setId(oResultSet.getInt("id"));
        this.setCantidad(oResultSet.getInt("cantidad"));

        if (expand > 0) {
            DaoInterface oComicDao = DaoFactory.getDao(oConnection, "comic", oUsuarioBeanSession);
            this.setObj_Comic((ComicBean) oComicDao.get(oResultSet.getInt("id_comic"), expand - 1));
        } else {
            this.setId_comic(oResultSet.getInt("id_comic"));
        }

        if (expand > 0 && oUsuarioBeanSession != null) {
            DaoInterface oFacturaDao = DaoFactory.getDao(oConnection, "factura", oUsuarioBeanSession);
            this.setObj_Factura((FacturaBean) oFacturaDao.get(oResultSet.getInt("id_factura"), expand - 1));
        } else {
            this.setId_factura(oResultSet.getInt("id_factura"));
        }

        return this;
    }

    @Override
    public String getColumns() {
        String strColumns = "";
        strColumns += "id,";
        strColumns += "cantidad,";
        strColumns += "id_comic,";
        strColumns += "id_factura";
        return strColumns;
    }

    @Override
    public String getValues() {
        String strColumns = "";
        strColumns += "null,";
        strColumns += cantidad + ",";
        strColumns += id_comic + ",";
        strColumns += id_factura;
        return strColumns;
    }

    @Override
    public String getPairs() {
        String strPairs = "";
        strPairs += "id=" + id + ",";
        strPairs += "cantidad=" + cantidad + ",";
        strPairs += "id_comic=" + id_comic + ",";
        strPairs += "id_factura=" + id_factura;
        strPairs += " WHERE id=" + id;
        return strPairs;
    }

}
