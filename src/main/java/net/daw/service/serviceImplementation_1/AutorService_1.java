/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.service.serviceImplementation_1;

import javax.servlet.http.HttpServletRequest;
import net.daw.service.genericServiceImplementation.GenericServiceImplementation;
import net.daw.service.publicServiceInterface.ServiceInterface;

/**
 *
 * @author a044531896d
 */
public class AutorService_1 extends GenericServiceImplementation implements ServiceInterface {

    HttpServletRequest oRequest;
    String ob = null;

    public AutorService_1(HttpServletRequest oRequest, String ob) {
        super(oRequest, ob);
        this.oRequest = oRequest;
        this.ob = ob;
    }

}
