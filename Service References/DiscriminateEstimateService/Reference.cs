﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrisisInterfere.DiscriminateEstimateService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="CommonViewModel", Namespace="http://schemas.datacontract.org/2004/07/BasicsServiceMODEL.CommonModel")]
    [System.SerializableAttribute()]
    public partial class CommonViewModel : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string TextField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string ValueField;
        
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
        public string Text {
            get {
                return this.TextField;
            }
            set {
                if ((object.ReferenceEquals(this.TextField, value) != true)) {
                    this.TextField = value;
                    this.RaisePropertyChanged("Text");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Value {
            get {
                return this.ValueField;
            }
            set {
                if ((object.ReferenceEquals(this.ValueField, value) != true)) {
                    this.ValueField = value;
                    this.RaisePropertyChanged("Value");
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
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="DiscriminateEstimateSearchModel", Namespace="http://schemas.datacontract.org/2004/07/BasicsServiceMODEL.DiscriminateEstimateMo" +
        "del")]
    [System.SerializableAttribute()]
    public partial class DiscriminateEstimateSearchModel : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int CounselorIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int DepartmentIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int DisposalSuggestionIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string EndDateField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int EndIndexField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string LoginNameField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int QuestionTypeIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string SexField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string StartDateField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int StartIndexField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int UserIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int WarningLevelField;
        
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
        public int CounselorID {
            get {
                return this.CounselorIDField;
            }
            set {
                if ((this.CounselorIDField.Equals(value) != true)) {
                    this.CounselorIDField = value;
                    this.RaisePropertyChanged("CounselorID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int DepartmentID {
            get {
                return this.DepartmentIDField;
            }
            set {
                if ((this.DepartmentIDField.Equals(value) != true)) {
                    this.DepartmentIDField = value;
                    this.RaisePropertyChanged("DepartmentID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int DisposalSuggestionID {
            get {
                return this.DisposalSuggestionIDField;
            }
            set {
                if ((this.DisposalSuggestionIDField.Equals(value) != true)) {
                    this.DisposalSuggestionIDField = value;
                    this.RaisePropertyChanged("DisposalSuggestionID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string EndDate {
            get {
                return this.EndDateField;
            }
            set {
                if ((object.ReferenceEquals(this.EndDateField, value) != true)) {
                    this.EndDateField = value;
                    this.RaisePropertyChanged("EndDate");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int EndIndex {
            get {
                return this.EndIndexField;
            }
            set {
                if ((this.EndIndexField.Equals(value) != true)) {
                    this.EndIndexField = value;
                    this.RaisePropertyChanged("EndIndex");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string LoginName {
            get {
                return this.LoginNameField;
            }
            set {
                if ((object.ReferenceEquals(this.LoginNameField, value) != true)) {
                    this.LoginNameField = value;
                    this.RaisePropertyChanged("LoginName");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int QuestionTypeID {
            get {
                return this.QuestionTypeIDField;
            }
            set {
                if ((this.QuestionTypeIDField.Equals(value) != true)) {
                    this.QuestionTypeIDField = value;
                    this.RaisePropertyChanged("QuestionTypeID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Sex {
            get {
                return this.SexField;
            }
            set {
                if ((object.ReferenceEquals(this.SexField, value) != true)) {
                    this.SexField = value;
                    this.RaisePropertyChanged("Sex");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string StartDate {
            get {
                return this.StartDateField;
            }
            set {
                if ((object.ReferenceEquals(this.StartDateField, value) != true)) {
                    this.StartDateField = value;
                    this.RaisePropertyChanged("StartDate");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int StartIndex {
            get {
                return this.StartIndexField;
            }
            set {
                if ((this.StartIndexField.Equals(value) != true)) {
                    this.StartIndexField = value;
                    this.RaisePropertyChanged("StartIndex");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int UserID {
            get {
                return this.UserIDField;
            }
            set {
                if ((this.UserIDField.Equals(value) != true)) {
                    this.UserIDField = value;
                    this.RaisePropertyChanged("UserID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int WarningLevel {
            get {
                return this.WarningLevelField;
            }
            set {
                if ((this.WarningLevelField.Equals(value) != true)) {
                    this.WarningLevelField = value;
                    this.RaisePropertyChanged("WarningLevel");
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
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="DiscernEstimateReportModel", Namespace="http://schemas.datacontract.org/2004/07/BasicsServiceMODEL.DiscriminateEstimateMo" +
        "del")]
    [System.SerializableAttribute()]
    public partial class DiscernEstimateReportModel : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.Collections.Generic.List<string> BelongToCodeField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int CounselorIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int DEIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DiscernEstimateDateField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DiscernEstimateReportField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DisposalSuggestionField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int QuestionTypeField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int UserIDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int WarningLevelField;
        
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
        public System.Collections.Generic.List<string> BelongToCode {
            get {
                return this.BelongToCodeField;
            }
            set {
                if ((object.ReferenceEquals(this.BelongToCodeField, value) != true)) {
                    this.BelongToCodeField = value;
                    this.RaisePropertyChanged("BelongToCode");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int CounselorID {
            get {
                return this.CounselorIDField;
            }
            set {
                if ((this.CounselorIDField.Equals(value) != true)) {
                    this.CounselorIDField = value;
                    this.RaisePropertyChanged("CounselorID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int DEID {
            get {
                return this.DEIDField;
            }
            set {
                if ((this.DEIDField.Equals(value) != true)) {
                    this.DEIDField = value;
                    this.RaisePropertyChanged("DEID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string DiscernEstimateDate {
            get {
                return this.DiscernEstimateDateField;
            }
            set {
                if ((object.ReferenceEquals(this.DiscernEstimateDateField, value) != true)) {
                    this.DiscernEstimateDateField = value;
                    this.RaisePropertyChanged("DiscernEstimateDate");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string DiscernEstimateReport {
            get {
                return this.DiscernEstimateReportField;
            }
            set {
                if ((object.ReferenceEquals(this.DiscernEstimateReportField, value) != true)) {
                    this.DiscernEstimateReportField = value;
                    this.RaisePropertyChanged("DiscernEstimateReport");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string DisposalSuggestion {
            get {
                return this.DisposalSuggestionField;
            }
            set {
                if ((object.ReferenceEquals(this.DisposalSuggestionField, value) != true)) {
                    this.DisposalSuggestionField = value;
                    this.RaisePropertyChanged("DisposalSuggestion");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int QuestionType {
            get {
                return this.QuestionTypeField;
            }
            set {
                if ((this.QuestionTypeField.Equals(value) != true)) {
                    this.QuestionTypeField = value;
                    this.RaisePropertyChanged("QuestionType");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int UserID {
            get {
                return this.UserIDField;
            }
            set {
                if ((this.UserIDField.Equals(value) != true)) {
                    this.UserIDField = value;
                    this.RaisePropertyChanged("UserID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int WarningLevel {
            get {
                return this.WarningLevelField;
            }
            set {
                if ((this.WarningLevelField.Equals(value) != true)) {
                    this.WarningLevelField = value;
                    this.RaisePropertyChanged("WarningLevel");
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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="DiscriminateEstimateService.IDiscriminateEstimateService")]
    public interface IDiscriminateEstimateService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDiscriminateEstimateService/GetUserSelected", ReplyAction="http://tempuri.org/IDiscriminateEstimateService/GetUserSelectedResponse")]
        System.Collections.Generic.List<CrisisInterfere.DiscriminateEstimateService.CommonViewModel> GetUserSelected(int userID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDiscriminateEstimateService/GetCounselor", ReplyAction="http://tempuri.org/IDiscriminateEstimateService/GetCounselorResponse")]
        System.Collections.Generic.List<CrisisInterfere.DiscriminateEstimateService.CommonViewModel> GetCounselor();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDiscriminateEstimateService/GetQuestionType", ReplyAction="http://tempuri.org/IDiscriminateEstimateService/GetQuestionTypeResponse")]
        System.Collections.Generic.List<CrisisInterfere.DiscriminateEstimateService.CommonViewModel> GetQuestionType();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDiscriminateEstimateService/InitialDiscriminateEstimateTable", ReplyAction="http://tempuri.org/IDiscriminateEstimateService/InitialDiscriminateEstimateTableR" +
            "esponse")]
        System.Data.DataSet InitialDiscriminateEstimateTable(CrisisInterfere.DiscriminateEstimateService.DiscriminateEstimateSearchModel model);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDiscriminateEstimateService/GetBelongToCode", ReplyAction="http://tempuri.org/IDiscriminateEstimateService/GetBelongToCodeResponse")]
        System.Collections.Generic.List<string> GetBelongToCode(int userID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDiscriminateEstimateService/GetWarningStateByBelongToCode", ReplyAction="http://tempuri.org/IDiscriminateEstimateService/GetWarningStateByBelongToCodeResp" +
            "onse")]
        string GetWarningStateByBelongToCode(string belongToCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDiscriminateEstimateService/AddDiscriminateEstimate", ReplyAction="http://tempuri.org/IDiscriminateEstimateService/AddDiscriminateEstimateResponse")]
        int AddDiscriminateEstimate(CrisisInterfere.DiscriminateEstimateService.DiscernEstimateReportModel model);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDiscriminateEstimateService/UpdateDiscriminateEstimate", ReplyAction="http://tempuri.org/IDiscriminateEstimateService/UpdateDiscriminateEstimateRespons" +
            "e")]
        int UpdateDiscriminateEstimate(CrisisInterfere.DiscriminateEstimateService.DiscernEstimateReportModel model);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IDiscriminateEstimateServiceChannel : CrisisInterfere.DiscriminateEstimateService.IDiscriminateEstimateService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class DiscriminateEstimateServiceClient : System.ServiceModel.ClientBase<CrisisInterfere.DiscriminateEstimateService.IDiscriminateEstimateService>, CrisisInterfere.DiscriminateEstimateService.IDiscriminateEstimateService {
        
        public DiscriminateEstimateServiceClient() {
        }
        
        public DiscriminateEstimateServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public DiscriminateEstimateServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DiscriminateEstimateServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DiscriminateEstimateServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Collections.Generic.List<CrisisInterfere.DiscriminateEstimateService.CommonViewModel> GetUserSelected(int userID) {
            return base.Channel.GetUserSelected(userID);
        }
        
        public System.Collections.Generic.List<CrisisInterfere.DiscriminateEstimateService.CommonViewModel> GetCounselor() {
            return base.Channel.GetCounselor();
        }
        
        public System.Collections.Generic.List<CrisisInterfere.DiscriminateEstimateService.CommonViewModel> GetQuestionType() {
            return base.Channel.GetQuestionType();
        }
        
        public System.Data.DataSet InitialDiscriminateEstimateTable(CrisisInterfere.DiscriminateEstimateService.DiscriminateEstimateSearchModel model) {
            return base.Channel.InitialDiscriminateEstimateTable(model);
        }
        
        public System.Collections.Generic.List<string> GetBelongToCode(int userID) {
            return base.Channel.GetBelongToCode(userID);
        }
        
        public string GetWarningStateByBelongToCode(string belongToCode) {
            return base.Channel.GetWarningStateByBelongToCode(belongToCode);
        }
        
        public int AddDiscriminateEstimate(CrisisInterfere.DiscriminateEstimateService.DiscernEstimateReportModel model) {
            return base.Channel.AddDiscriminateEstimate(model);
        }
        
        public int UpdateDiscriminateEstimate(CrisisInterfere.DiscriminateEstimateService.DiscernEstimateReportModel model) {
            return base.Channel.UpdateDiscriminateEstimate(model);
        }
    }
}
