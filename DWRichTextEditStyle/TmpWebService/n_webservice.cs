﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by wsdl, Version=4.0.30319.1.
// 
namespace WebService {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="n_webserviceSoap", Namespace="http://tempurl.org")]
    public partial class n_webservice : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback get_addOperationCompleted;
        
        private System.Threading.SendOrPostCallback get_infoOperationCompleted;
        
        /// <remarks/>
        public n_webservice() {
            string urlSetting = System.Configuration.ConfigurationManager.AppSettings["EndpointURL"];
            if ((urlSetting != null)) {
                this.Url = urlSetting;
            }
            else {
                this.Url = "http://192.0.3.36/webservice/n_webservice.asmx";
            }
        }
        
        /// <remarks/>
        public event get_addCompletedEventHandler get_addCompleted;
        
        /// <remarks/>
        public event get_infoCompletedEventHandler get_infoCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempurl.org/get_add", RequestNamespace="http://tempurl.org", ResponseNamespace="http://tempurl.org", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public short get_add(short ai_a, short ai_b) {
            object[] results = this.Invoke("get_add", new object[] {
                        ai_a,
                        ai_b});
            return ((short)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult Beginget_add(short ai_a, short ai_b, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("get_add", new object[] {
                        ai_a,
                        ai_b}, callback, asyncState);
        }
        
        /// <remarks/>
        public short Endget_add(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((short)(results[0]));
        }
        
        /// <remarks/>
        public void get_addAsync(short ai_a, short ai_b) {
            this.get_addAsync(ai_a, ai_b, null);
        }
        
        /// <remarks/>
        public void get_addAsync(short ai_a, short ai_b, object userState) {
            if ((this.get_addOperationCompleted == null)) {
                this.get_addOperationCompleted = new System.Threading.SendOrPostCallback(this.Onget_addOperationCompleted);
            }
            this.InvokeAsync("get_add", new object[] {
                        ai_a,
                        ai_b}, this.get_addOperationCompleted, userState);
        }
        
        private void Onget_addOperationCompleted(object arg) {
            if ((this.get_addCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.get_addCompleted(this, new get_addCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempurl.org/get_info", RequestNamespace="http://tempurl.org", ResponseNamespace="http://tempurl.org", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string get_info() {
            object[] results = this.Invoke("get_info", new object[0]);
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult Beginget_info(System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("get_info", new object[0], callback, asyncState);
        }
        
        /// <remarks/>
        public string Endget_info(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void get_infoAsync() {
            this.get_infoAsync(null);
        }
        
        /// <remarks/>
        public void get_infoAsync(object userState) {
            if ((this.get_infoOperationCompleted == null)) {
                this.get_infoOperationCompleted = new System.Threading.SendOrPostCallback(this.Onget_infoOperationCompleted);
            }
            this.InvokeAsync("get_info", new object[0], this.get_infoOperationCompleted, userState);
        }
        
        private void Onget_infoOperationCompleted(object arg) {
            if ((this.get_infoCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.get_infoCompleted(this, new get_infoCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "4.0.30319.1")]
    public delegate void get_addCompletedEventHandler(object sender, get_addCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class get_addCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal get_addCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public short Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((short)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "4.0.30319.1")]
    public delegate void get_infoCompletedEventHandler(object sender, get_infoCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class get_infoCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal get_infoCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
}
