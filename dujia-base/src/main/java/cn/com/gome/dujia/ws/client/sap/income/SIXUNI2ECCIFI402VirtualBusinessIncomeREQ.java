package cn.com.gome.dujia.ws.client.sap.income;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;
/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.4-b01
 * Generated source version: 2.2
 * 
 */
@WebService(name = "SI_XUNI2ECC_IFI402_VirtualBusinessIncome_REQ", targetNamespace = "URN:XUNI")
@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
@XmlSeeAlso({
    ObjectFactory.class
})
public interface SIXUNI2ECCIFI402VirtualBusinessIncomeREQ {

    /**
     * 
     * @param mtIFI402VirtualBusinessIncomeREQ
     * @return
     *     returns cn.com.gome.showticket.ws.sap.income.client.DTIFI402VirtualBusinessIncomeRES
     */
    @WebMethod(operationName = "SI_XUNI2ECC_IFI402_VirtualBusinessIncome_REQ", action = "http://sap.com/xi/WebService/soap1.1")
    @WebResult(name = "MT_IFI402_VirtualBusinessIncome_RES", targetNamespace = "URN:ECC", partName = "MT_IFI402_VirtualBusinessIncome_RES")
    public DTIFI402VirtualBusinessIncomeRES siXUNI2ECCIFI402VirtualBusinessIncomeREQ(
        @WebParam(name = "MT_IFI402_VirtualBusinessIncome_REQ", targetNamespace = "URN:ECC", partName = "MT_IFI402_VirtualBusinessIncome_REQ")
        DTIFI402VirtualBusinessIncomeREQ mtIFI402VirtualBusinessIncomeREQ);

}
