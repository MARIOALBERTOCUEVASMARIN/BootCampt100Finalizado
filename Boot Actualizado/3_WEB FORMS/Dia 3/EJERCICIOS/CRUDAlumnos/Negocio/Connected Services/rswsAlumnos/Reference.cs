﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Negocio.rswsAlumnos {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="AportacionesIMSS", Namespace="http://tempuri.org/")]
    [System.SerializableAttribute()]
    public partial class AportacionesIMSS : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private decimal EnfermedadMaternidadField;
        
        private decimal InvalidezVidaField;
        
        private decimal RetiroField;
        
        private decimal CesantiaField;
        
        private decimal InfonavitField;
        
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
        public decimal EnfermedadMaternidad {
            get {
                return this.EnfermedadMaternidadField;
            }
            set {
                if ((this.EnfermedadMaternidadField.Equals(value) != true)) {
                    this.EnfermedadMaternidadField = value;
                    this.RaisePropertyChanged("EnfermedadMaternidad");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public decimal InvalidezVida {
            get {
                return this.InvalidezVidaField;
            }
            set {
                if ((this.InvalidezVidaField.Equals(value) != true)) {
                    this.InvalidezVidaField = value;
                    this.RaisePropertyChanged("InvalidezVida");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public decimal Retiro {
            get {
                return this.RetiroField;
            }
            set {
                if ((this.RetiroField.Equals(value) != true)) {
                    this.RetiroField = value;
                    this.RaisePropertyChanged("Retiro");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=3)]
        public decimal Cesantia {
            get {
                return this.CesantiaField;
            }
            set {
                if ((this.CesantiaField.Equals(value) != true)) {
                    this.CesantiaField = value;
                    this.RaisePropertyChanged("Cesantia");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=4)]
        public decimal Infonavit {
            get {
                return this.InfonavitField;
            }
            set {
                if ((this.InfonavitField.Equals(value) != true)) {
                    this.InfonavitField = value;
                    this.RaisePropertyChanged("Infonavit");
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
    [System.Runtime.Serialization.DataContractAttribute(Name="ItemTablaISR", Namespace="http://tempuri.org/")]
    [System.SerializableAttribute()]
    public partial class ItemTablaISR : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private decimal LimiteInferiorField;
        
        private decimal LimiteSuperiorField;
        
        private decimal CuotaFijaField;
        
        private decimal ExcedenteField;
        
        private decimal SubsidioField;
        
        private decimal ISRField;
        
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
        public decimal LimiteInferior {
            get {
                return this.LimiteInferiorField;
            }
            set {
                if ((this.LimiteInferiorField.Equals(value) != true)) {
                    this.LimiteInferiorField = value;
                    this.RaisePropertyChanged("LimiteInferior");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public decimal LimiteSuperior {
            get {
                return this.LimiteSuperiorField;
            }
            set {
                if ((this.LimiteSuperiorField.Equals(value) != true)) {
                    this.LimiteSuperiorField = value;
                    this.RaisePropertyChanged("LimiteSuperior");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=2)]
        public decimal CuotaFija {
            get {
                return this.CuotaFijaField;
            }
            set {
                if ((this.CuotaFijaField.Equals(value) != true)) {
                    this.CuotaFijaField = value;
                    this.RaisePropertyChanged("CuotaFija");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=3)]
        public decimal Excedente {
            get {
                return this.ExcedenteField;
            }
            set {
                if ((this.ExcedenteField.Equals(value) != true)) {
                    this.ExcedenteField = value;
                    this.RaisePropertyChanged("Excedente");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=4)]
        public decimal Subsidio {
            get {
                return this.SubsidioField;
            }
            set {
                if ((this.SubsidioField.Equals(value) != true)) {
                    this.SubsidioField = value;
                    this.RaisePropertyChanged("Subsidio");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=5)]
        public decimal ISR {
            get {
                return this.ISRField;
            }
            set {
                if ((this.ISRField.Equals(value) != true)) {
                    this.ISRField = value;
                    this.RaisePropertyChanged("ISR");
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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="rswsAlumnos.swAlumnosSoap")]
    public interface swAlumnosSoap {
        
        // CODEGEN: Se está generando un contrato de mensaje, ya que el nombre de elemento calcularIMSSResult del espacio de nombres http://tempuri.org/ no está marcado para aceptar valores nil.
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/calcularIMSS", ReplyAction="*")]
        Negocio.rswsAlumnos.calcularIMSSResponse calcularIMSS(Negocio.rswsAlumnos.calcularIMSSRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/calcularIMSS", ReplyAction="*")]
        System.Threading.Tasks.Task<Negocio.rswsAlumnos.calcularIMSSResponse> calcularIMSSAsync(Negocio.rswsAlumnos.calcularIMSSRequest request);
        
        // CODEGEN: Se está generando un contrato de mensaje, ya que el nombre de elemento itemTablaISRResult del espacio de nombres http://tempuri.org/ no está marcado para aceptar valores nil.
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/itemTablaISR", ReplyAction="*")]
        Negocio.rswsAlumnos.itemTablaISRResponse itemTablaISR(Negocio.rswsAlumnos.itemTablaISRRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/itemTablaISR", ReplyAction="*")]
        System.Threading.Tasks.Task<Negocio.rswsAlumnos.itemTablaISRResponse> itemTablaISRAsync(Negocio.rswsAlumnos.itemTablaISRRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class calcularIMSSRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="calcularIMSS", Namespace="http://tempuri.org/", Order=0)]
        public Negocio.rswsAlumnos.calcularIMSSRequestBody Body;
        
        public calcularIMSSRequest() {
        }
        
        public calcularIMSSRequest(Negocio.rswsAlumnos.calcularIMSSRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class calcularIMSSRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=0)]
        public int id;
        
        public calcularIMSSRequestBody() {
        }
        
        public calcularIMSSRequestBody(int id) {
            this.id = id;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class calcularIMSSResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="calcularIMSSResponse", Namespace="http://tempuri.org/", Order=0)]
        public Negocio.rswsAlumnos.calcularIMSSResponseBody Body;
        
        public calcularIMSSResponse() {
        }
        
        public calcularIMSSResponse(Negocio.rswsAlumnos.calcularIMSSResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class calcularIMSSResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public Negocio.rswsAlumnos.AportacionesIMSS calcularIMSSResult;
        
        public calcularIMSSResponseBody() {
        }
        
        public calcularIMSSResponseBody(Negocio.rswsAlumnos.AportacionesIMSS calcularIMSSResult) {
            this.calcularIMSSResult = calcularIMSSResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class itemTablaISRRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="itemTablaISR", Namespace="http://tempuri.org/", Order=0)]
        public Negocio.rswsAlumnos.itemTablaISRRequestBody Body;
        
        public itemTablaISRRequest() {
        }
        
        public itemTablaISRRequest(Negocio.rswsAlumnos.itemTablaISRRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class itemTablaISRRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=0)]
        public int id;
        
        public itemTablaISRRequestBody() {
        }
        
        public itemTablaISRRequestBody(int id) {
            this.id = id;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class itemTablaISRResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="itemTablaISRResponse", Namespace="http://tempuri.org/", Order=0)]
        public Negocio.rswsAlumnos.itemTablaISRResponseBody Body;
        
        public itemTablaISRResponse() {
        }
        
        public itemTablaISRResponse(Negocio.rswsAlumnos.itemTablaISRResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class itemTablaISRResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public Negocio.rswsAlumnos.ItemTablaISR itemTablaISRResult;
        
        public itemTablaISRResponseBody() {
        }
        
        public itemTablaISRResponseBody(Negocio.rswsAlumnos.ItemTablaISR itemTablaISRResult) {
            this.itemTablaISRResult = itemTablaISRResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface swAlumnosSoapChannel : Negocio.rswsAlumnos.swAlumnosSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class swAlumnosSoapClient : System.ServiceModel.ClientBase<Negocio.rswsAlumnos.swAlumnosSoap>, Negocio.rswsAlumnos.swAlumnosSoap {
        
        public swAlumnosSoapClient() {
        }
        
        public swAlumnosSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public swAlumnosSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public swAlumnosSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public swAlumnosSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        Negocio.rswsAlumnos.calcularIMSSResponse Negocio.rswsAlumnos.swAlumnosSoap.calcularIMSS(Negocio.rswsAlumnos.calcularIMSSRequest request) {
            return base.Channel.calcularIMSS(request);
        }
        
        public Negocio.rswsAlumnos.AportacionesIMSS calcularIMSS(int id) {
            Negocio.rswsAlumnos.calcularIMSSRequest inValue = new Negocio.rswsAlumnos.calcularIMSSRequest();
            inValue.Body = new Negocio.rswsAlumnos.calcularIMSSRequestBody();
            inValue.Body.id = id;
            Negocio.rswsAlumnos.calcularIMSSResponse retVal = ((Negocio.rswsAlumnos.swAlumnosSoap)(this)).calcularIMSS(inValue);
            return retVal.Body.calcularIMSSResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<Negocio.rswsAlumnos.calcularIMSSResponse> Negocio.rswsAlumnos.swAlumnosSoap.calcularIMSSAsync(Negocio.rswsAlumnos.calcularIMSSRequest request) {
            return base.Channel.calcularIMSSAsync(request);
        }
        
        public System.Threading.Tasks.Task<Negocio.rswsAlumnos.calcularIMSSResponse> calcularIMSSAsync(int id) {
            Negocio.rswsAlumnos.calcularIMSSRequest inValue = new Negocio.rswsAlumnos.calcularIMSSRequest();
            inValue.Body = new Negocio.rswsAlumnos.calcularIMSSRequestBody();
            inValue.Body.id = id;
            return ((Negocio.rswsAlumnos.swAlumnosSoap)(this)).calcularIMSSAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        Negocio.rswsAlumnos.itemTablaISRResponse Negocio.rswsAlumnos.swAlumnosSoap.itemTablaISR(Negocio.rswsAlumnos.itemTablaISRRequest request) {
            return base.Channel.itemTablaISR(request);
        }
        
        public Negocio.rswsAlumnos.ItemTablaISR itemTablaISR(int id) {
            Negocio.rswsAlumnos.itemTablaISRRequest inValue = new Negocio.rswsAlumnos.itemTablaISRRequest();
            inValue.Body = new Negocio.rswsAlumnos.itemTablaISRRequestBody();
            inValue.Body.id = id;
            Negocio.rswsAlumnos.itemTablaISRResponse retVal = ((Negocio.rswsAlumnos.swAlumnosSoap)(this)).itemTablaISR(inValue);
            return retVal.Body.itemTablaISRResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<Negocio.rswsAlumnos.itemTablaISRResponse> Negocio.rswsAlumnos.swAlumnosSoap.itemTablaISRAsync(Negocio.rswsAlumnos.itemTablaISRRequest request) {
            return base.Channel.itemTablaISRAsync(request);
        }
        
        public System.Threading.Tasks.Task<Negocio.rswsAlumnos.itemTablaISRResponse> itemTablaISRAsync(int id) {
            Negocio.rswsAlumnos.itemTablaISRRequest inValue = new Negocio.rswsAlumnos.itemTablaISRRequest();
            inValue.Body = new Negocio.rswsAlumnos.itemTablaISRRequestBody();
            inValue.Body.id = id;
            return ((Negocio.rswsAlumnos.swAlumnosSoap)(this)).itemTablaISRAsync(inValue);
        }
    }
}
