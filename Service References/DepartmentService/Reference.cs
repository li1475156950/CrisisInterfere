﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.42000
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrisisInterfere.DepartmentService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="DepartmentEntity", Namespace="http://schemas.datacontract.org/2004/07/JSBR.Model.BaseTable.Entity")]
    [System.SerializableAttribute()]
    public partial class DepartmentEntity : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string _d_chiidField;
        
        private int _d_idField;
        
        private string _d_nameField;
        
        private string _d_numberField;
        
        private string _d_remarkField;
        
        private int create_idField;
        
        private string d_chiIDsField;
        
        private string d_codeField;
        
        private string d_deleteField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _d_chiid {
            get {
                return this._d_chiidField;
            }
            set {
                if ((object.ReferenceEquals(this._d_chiidField, value) != true)) {
                    this._d_chiidField = value;
                    this.RaisePropertyChanged("_d_chiid");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _d_id {
            get {
                return this._d_idField;
            }
            set {
                if ((this._d_idField.Equals(value) != true)) {
                    this._d_idField = value;
                    this.RaisePropertyChanged("_d_id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _d_name {
            get {
                return this._d_nameField;
            }
            set {
                if ((object.ReferenceEquals(this._d_nameField, value) != true)) {
                    this._d_nameField = value;
                    this.RaisePropertyChanged("_d_name");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _d_number {
            get {
                return this._d_numberField;
            }
            set {
                if ((object.ReferenceEquals(this._d_numberField, value) != true)) {
                    this._d_numberField = value;
                    this.RaisePropertyChanged("_d_number");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string _d_remark {
            get {
                return this._d_remarkField;
            }
            set {
                if ((object.ReferenceEquals(this._d_remarkField, value) != true)) {
                    this._d_remarkField = value;
                    this.RaisePropertyChanged("_d_remark");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int create_id {
            get {
                return this.create_idField;
            }
            set {
                if ((this.create_idField.Equals(value) != true)) {
                    this.create_idField = value;
                    this.RaisePropertyChanged("create_id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string d_chiIDs {
            get {
                return this.d_chiIDsField;
            }
            set {
                if ((object.ReferenceEquals(this.d_chiIDsField, value) != true)) {
                    this.d_chiIDsField = value;
                    this.RaisePropertyChanged("d_chiIDs");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string d_code {
            get {
                return this.d_codeField;
            }
            set {
                if ((object.ReferenceEquals(this.d_codeField, value) != true)) {
                    this.d_codeField = value;
                    this.RaisePropertyChanged("d_code");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string d_delete {
            get {
                return this.d_deleteField;
            }
            set {
                if ((object.ReferenceEquals(this.d_deleteField, value) != true)) {
                    this.d_deleteField = value;
                    this.RaisePropertyChanged("d_delete");
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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="DepartmentService.IDepartmentService")]
    public interface IDepartmentService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/DoWork", ReplyAction="http://tempuri.org/IDepartmentService/DoWorkResponse")]
        void DoWork();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/DepartmentDT", ReplyAction="http://tempuri.org/IDepartmentService/DepartmentDTResponse")]
        System.Data.DataSet DepartmentDT(string StarPageIndex, string EndPageIndex, string EnterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/DepartmentsA", ReplyAction="http://tempuri.org/IDepartmentService/DepartmentsAResponse")]
        System.Data.DataTable DepartmentsA(string loginName, string EnterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/DepartmentInsert", ReplyAction="http://tempuri.org/IDepartmentService/DepartmentInsertResponse")]
        long DepartmentInsert(CrisisInterfere.DepartmentService.DepartmentEntity model);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/updata", ReplyAction="http://tempuri.org/IDepartmentService/updataResponse")]
        bool updata(CrisisInterfere.DepartmentService.DepartmentEntity model);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/UPdataDelete", ReplyAction="http://tempuri.org/IDepartmentService/UPdataDeleteResponse")]
        bool UPdataDelete(int D_id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/Aselect", ReplyAction="http://tempuri.org/IDepartmentService/AselectResponse")]
        CrisisInterfere.DepartmentService.DepartmentEntity Aselect(int D_id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/Aselect_More", ReplyAction="http://tempuri.org/IDepartmentService/Aselect_MoreResponse")]
        System.Collections.Generic.List<CrisisInterfere.DepartmentService.DepartmentEntity> Aselect_More(System.Collections.Generic.List<string> D_id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/GetDepartmentByName", ReplyAction="http://tempuri.org/IDepartmentService/GetDepartmentByNameResponse")]
        int GetDepartmentByName(string departName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/GetRoleName", ReplyAction="http://tempuri.org/IDepartmentService/GetRoleNameResponse")]
        string GetRoleName(string loginname, string EnterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/GetDepTemp", ReplyAction="http://tempuri.org/IDepartmentService/GetDepTempResponse")]
        System.Data.DataTable GetDepTemp(string loginName, string ECode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/nulls", ReplyAction="http://tempuri.org/IDepartmentService/nullsResponse")]
        bool nulls(string D_name, int D_ID, int D_chiID, string EnterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/Department_num", ReplyAction="http://tempuri.org/IDepartmentService/Department_numResponse")]
        int Department_num(int Department_ID, string EnterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/GetDepartmentAuthority", ReplyAction="http://tempuri.org/IDepartmentService/GetDepartmentAuthorityResponse")]
        System.Data.DataTable GetDepartmentAuthority(string loginame, string EnterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/Departments", ReplyAction="http://tempuri.org/IDepartmentService/DepartmentsResponse")]
        System.Data.DataTable Departments(string EnterpriseCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/GetChildDepByDepID", ReplyAction="http://tempuri.org/IDepartmentService/GetChildDepByDepIDResponse")]
        System.Collections.Generic.List<int> GetChildDepByDepID(int depID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDepartmentService/GetPeopleCountByDepID", ReplyAction="http://tempuri.org/IDepartmentService/GetPeopleCountByDepIDResponse")]
        int GetPeopleCountByDepID(int depID);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IDepartmentServiceChannel : CrisisInterfere.DepartmentService.IDepartmentService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class DepartmentServiceClient : System.ServiceModel.ClientBase<CrisisInterfere.DepartmentService.IDepartmentService>, CrisisInterfere.DepartmentService.IDepartmentService {
        
        public DepartmentServiceClient() {
        }
        
        public DepartmentServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public DepartmentServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DepartmentServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DepartmentServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public void DoWork() {
            base.Channel.DoWork();
        }
        
        public System.Data.DataSet DepartmentDT(string StarPageIndex, string EndPageIndex, string EnterpriseCode) {
            return base.Channel.DepartmentDT(StarPageIndex, EndPageIndex, EnterpriseCode);
        }
        
        public System.Data.DataTable DepartmentsA(string loginName, string EnterpriseCode) {
            return base.Channel.DepartmentsA(loginName, EnterpriseCode);
        }
        
        public long DepartmentInsert(CrisisInterfere.DepartmentService.DepartmentEntity model) {
            return base.Channel.DepartmentInsert(model);
        }
        
        public bool updata(CrisisInterfere.DepartmentService.DepartmentEntity model) {
            return base.Channel.updata(model);
        }
        
        public bool UPdataDelete(int D_id) {
            return base.Channel.UPdataDelete(D_id);
        }
        
        public CrisisInterfere.DepartmentService.DepartmentEntity Aselect(int D_id) {
            return base.Channel.Aselect(D_id);
        }
        
        public System.Collections.Generic.List<CrisisInterfere.DepartmentService.DepartmentEntity> Aselect_More(System.Collections.Generic.List<string> D_id) {
            return base.Channel.Aselect_More(D_id);
        }
        
        public int GetDepartmentByName(string departName) {
            return base.Channel.GetDepartmentByName(departName);
        }
        
        public string GetRoleName(string loginname, string EnterpriseCode) {
            return base.Channel.GetRoleName(loginname, EnterpriseCode);
        }
        
        public System.Data.DataTable GetDepTemp(string loginName, string ECode) {
            return base.Channel.GetDepTemp(loginName, ECode);
        }
        
        public bool nulls(string D_name, int D_ID, int D_chiID, string EnterpriseCode) {
            return base.Channel.nulls(D_name, D_ID, D_chiID, EnterpriseCode);
        }
        
        public int Department_num(int Department_ID, string EnterpriseCode) {
            return base.Channel.Department_num(Department_ID, EnterpriseCode);
        }
        
        public System.Data.DataTable GetDepartmentAuthority(string loginame, string EnterpriseCode) {
            return base.Channel.GetDepartmentAuthority(loginame, EnterpriseCode);
        }
        
        public System.Data.DataTable Departments(string EnterpriseCode) {
            return base.Channel.Departments(EnterpriseCode);
        }
        
        public System.Collections.Generic.List<int> GetChildDepByDepID(int depID) {
            return base.Channel.GetChildDepByDepID(depID);
        }
        
        public int GetPeopleCountByDepID(int depID) {
            return base.Channel.GetPeopleCountByDepID(depID);
        }
    }
}
