﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrisisInterfere.RoleTypeService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="RoleTypeEntity", Namespace="http://schemas.datacontract.org/2004/07/BasicsServiceMODEL.BasicSettingModel")]
    [System.SerializableAttribute()]
    public partial class RoleTypeEntity : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int RoleType_IDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string RoleType_NameField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int RoleType_ID {
            get {
                return this.RoleType_IDField;
            }
            set {
                if ((this.RoleType_IDField.Equals(value) != true)) {
                    this.RoleType_IDField = value;
                    this.RaisePropertyChanged("RoleType_ID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string RoleType_Name {
            get {
                return this.RoleType_NameField;
            }
            set {
                if ((object.ReferenceEquals(this.RoleType_NameField, value) != true)) {
                    this.RoleType_NameField = value;
                    this.RaisePropertyChanged("RoleType_Name");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="RoleTypeService.IRoleTypeService")]
    public interface IRoleTypeService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IRoleTypeService/GetRoleTypeList", ReplyAction="http://tempuri.org/IRoleTypeService/GetRoleTypeListResponse")]
        System.Collections.Generic.List<CrisisInterfere.RoleTypeService.RoleTypeEntity> GetRoleTypeList(int userID);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IRoleTypeServiceChannel : CrisisInterfere.RoleTypeService.IRoleTypeService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class RoleTypeServiceClient : System.ServiceModel.ClientBase<CrisisInterfere.RoleTypeService.IRoleTypeService>, CrisisInterfere.RoleTypeService.IRoleTypeService {
        
        public RoleTypeServiceClient() {
        }
        
        public RoleTypeServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public RoleTypeServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public RoleTypeServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public RoleTypeServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Collections.Generic.List<CrisisInterfere.RoleTypeService.RoleTypeEntity> GetRoleTypeList(int userID) {
            return base.Channel.GetRoleTypeList(userID);
        }
    }
}
