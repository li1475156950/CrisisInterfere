﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrisisInterfere.BasicsDataService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="BasicsDataService.IBasicsDataService")]
    public interface IBasicsDataService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IBasicsDataService/GetID", ReplyAction="http://tempuri.org/IBasicsDataService/GetIDResponse")]
        int GetID();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IBasicsDataServiceChannel : CrisisInterfere.BasicsDataService.IBasicsDataService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class BasicsDataServiceClient : System.ServiceModel.ClientBase<CrisisInterfere.BasicsDataService.IBasicsDataService>, CrisisInterfere.BasicsDataService.IBasicsDataService {
        
        public BasicsDataServiceClient() {
        }
        
        public BasicsDataServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public BasicsDataServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public BasicsDataServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public BasicsDataServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public int GetID() {
            return base.Channel.GetID();
        }
    }
}
