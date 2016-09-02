package cn.com.gome.dujia.ws.client.rb;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;
/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.4-b01
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "AcceptRefundTaskImplService", targetNamespace = "http://impl.webservice.rb.gome.founder.com/", wsdlLocation = "http://rbuat.ds.gome.com.cn/ws/acceptTaskEc?wsdl")
public class AcceptRefundTaskImplService
    extends Service
{

    private final static URL ACCEPTREFUNDTASKIMPLSERVICE_WSDL_LOCATION;
    private final static WebServiceException ACCEPTREFUNDTASKIMPLSERVICE_EXCEPTION;
    private final static QName ACCEPTREFUNDTASKIMPLSERVICE_QNAME = new QName("http://impl.webservice.rb.gome.founder.com/", "AcceptRefundTaskImplService");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://rbuat.ds.gome.com.cn/ws/acceptTaskEc?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        ACCEPTREFUNDTASKIMPLSERVICE_WSDL_LOCATION = url;
        ACCEPTREFUNDTASKIMPLSERVICE_EXCEPTION = e;
    }

    public AcceptRefundTaskImplService() {
        super(__getWsdlLocation(), ACCEPTREFUNDTASKIMPLSERVICE_QNAME);
    }

    public AcceptRefundTaskImplService(WebServiceFeature... features) {
        super(__getWsdlLocation(), ACCEPTREFUNDTASKIMPLSERVICE_QNAME, features);
    }

    public AcceptRefundTaskImplService(URL wsdlLocation) {
        super(wsdlLocation, ACCEPTREFUNDTASKIMPLSERVICE_QNAME);
    }

    public AcceptRefundTaskImplService(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, ACCEPTREFUNDTASKIMPLSERVICE_QNAME, features);
    }

    public AcceptRefundTaskImplService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public AcceptRefundTaskImplService(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns AcceptRefundTask
     */
    @WebEndpoint(name = "AcceptRefundTaskImplPort")
    public AcceptRefundTask getAcceptRefundTaskImplPort() {
        return super.getPort(new QName("http://impl.webservice.rb.gome.founder.com/", "AcceptRefundTaskImplPort"), AcceptRefundTask.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns AcceptRefundTask
     */
    @WebEndpoint(name = "AcceptRefundTaskImplPort")
    public AcceptRefundTask getAcceptRefundTaskImplPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://impl.webservice.rb.gome.founder.com/", "AcceptRefundTaskImplPort"), AcceptRefundTask.class, features);
    }

    private static URL __getWsdlLocation() {
        if (ACCEPTREFUNDTASKIMPLSERVICE_EXCEPTION!= null) {
            throw ACCEPTREFUNDTASKIMPLSERVICE_EXCEPTION;
        }
        return ACCEPTREFUNDTASKIMPLSERVICE_WSDL_LOCATION;
    }

}
