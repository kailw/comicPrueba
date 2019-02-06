/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.bean.beanImplementation;

/**
 *
 * @author kevin
 */
public class ItemBean {
    private int cantidad;
    private ComicBean obj_Comic;

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public ComicBean getObj_Comic() {
        return obj_Comic;
    }

    public void setObj_Comic(ComicBean obj_Comic) {
        this.obj_Comic = obj_Comic;
    }


    
}
