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
public class ComicEditorialBean extends GenericBeanImplementation implements BeanInterface {

    @Expose(serialize = false)
    private int id_editorial;

    @Expose(serialize = false)
    private int id_comic;

    @Expose(deserialize = false)
    private EditorialBean obj_editorial;

    @Expose(deserialize = false)
    private ComicBean obj_comic;

    public int getId_editorial() {
        return id_editorial;
    }

    public void setId_editorial(int id_editorial) {
        this.id_editorial = id_editorial;
    }

    public int getId_comic() {
        return id_comic;
    }

    public void setId_comic(int id_comic) {
        this.id_comic = id_comic;
    }

    public EditorialBean getObj_editorial() {
        return obj_editorial;
    }

    public void setObj_editorial(EditorialBean obj_editorial) {
        this.obj_editorial = obj_editorial;
    }

    public ComicBean getObj_comic() {
        return obj_comic;
    }

    public void setObj_comic(ComicBean obj_comic) {
        this.obj_comic = obj_comic;
    }

    @Override
    public ComicEditorialBean fill(ResultSet oResultSet, Connection oConnection, Integer expand, UsuarioBean oUsuarioBeanSession) throws Exception, Exception {
        this.setId(oResultSet.getInt("id"));

        if (expand > 0) {
            DaoInterface oeditorialDao = DaoFactory.getDao(oConnection, "editorial", oUsuarioBeanSession);
            this.setObj_editorial((EditorialBean) oeditorialDao.get(oResultSet.getInt("id_editorial"), expand - 1));
        } else {
            this.setId_editorial(oResultSet.getInt("id_editorial"));
        }

        if (expand > 0) {
            DaoInterface ocomicDao = DaoFactory.getDao(oConnection, "comic", oUsuarioBeanSession);
            this.setObj_comic((ComicBean) ocomicDao.get(oResultSet.getInt("id_comic"), expand - 1));
        } else {
            this.setId_editorial(oResultSet.getInt("id_comic"));
        }

        return this;
    }

    @Override
    public String getColumns() {
        String strColumns = "";
        strColumns += "id,";
        strColumns += "id_editorial,";
        strColumns += "id_comic";

        return strColumns;
    }

    @Override
    public String getValues() {
        String strColumns = "";
        strColumns += "null,";
        strColumns += id_editorial + ",";
        strColumns += id_comic;

        return strColumns;
    }

    @Override
    public String getPairs() {
        String strPairs = "";
        strPairs += "id=" + id + ",";
        strPairs += "id_editorial=" + id_editorial + ",";
        strPairs += "id_comic=" + id_comic;
        strPairs += " WHERE id=" + id;

        return strPairs;
    }

}
