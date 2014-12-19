package com.nekojarashi;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author y-okubo
 */
public interface Hello extends Remote {
    String sayHello() throws RemoteException;    
}
