include Java
java_package 'com.nekojarashi'
java_import 'com.nekojarashi.Hello'

java_import java.lang.System
java_import java.rmi.Remote
java_import java.rmi.RemoteException
java_import java.rmi.registry.LocateRegistry
java_import java.rmi.registry.Registry
java_import java.rmi.server.UnicastRemoteObject 
java_import java.rmi.RMISecurityManager

class HelloRMIServer
  include com::nekojarashi::Hello
  def sayHello()
    puts 'Called by client'
    return 'Hello, RMI World on JRuby!'
  end
end

# System.set_security_manager(RMISecurityManager.new)
hello = HelloRMIServer.new
registry = LocateRegistry.create_registry(Registry.REGISTRY_PORT)
remote = UnicastRemoteObject.export_object(hello, 0);
registry.rebind("hello", remote)
