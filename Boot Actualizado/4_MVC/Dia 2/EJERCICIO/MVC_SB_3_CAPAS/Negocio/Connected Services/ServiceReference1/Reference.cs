﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Negocio.ServiceReference1 {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="AportacionesIMSS", Namespace="http://schemas.datacontract.org/2004/07/HolaMundo_WCF")]
    [System.SerializableAttribute()]
    public partial class AportacionesIMSS : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal CesantiaField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal EnfermedadesMaternidadField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal InfonavitField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal InvalidezVidaField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal RetiroField;
        
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
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public decimal EnfermedadesMaternidad {
            get {
                return this.EnfermedadesMaternidadField;
            }
            set {
                if ((this.EnfermedadesMaternidadField.Equals(value) != true)) {
                    this.EnfermedadesMaternidadField = value;
                    this.RaisePropertyChanged("EnfermedadesMaternidad");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
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
        
        [System.Runtime.Serialization.DataMemberAttribute()]
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
        
        [System.Runtime.Serialization.DataMemberAttribute()]
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
    [System.Runtime.Serialization.DataContractAttribute(Name="ItemTablaISR", Namespace="http://schemas.datacontract.org/2004/07/HolaMundo_WCF")]
    [System.SerializableAttribute()]
    public partial class ItemTablaISR : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal CuotaFijaField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal ExcedenteField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal ImpuestoField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal LimInferiorField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal LimSuperiorField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private decimal SubsidioField;
        
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
        
        [System.Runtime.Serialization.DataMemberAttribute()]
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
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public decimal Impuesto {
            get {
                return this.ImpuestoField;
            }
            set {
                if ((this.ImpuestoField.Equals(value) != true)) {
                    this.ImpuestoField = value;
                    this.RaisePropertyChanged("Impuesto");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public decimal LimInferior {
            get {
                return this.LimInferiorField;
            }
            set {
                if ((this.LimInferiorField.Equals(value) != true)) {
                    this.LimInferiorField = value;
                    this.RaisePropertyChanged("LimInferior");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public decimal LimSuperior {
            get {
                return this.LimSuperiorField;
            }
            set {
                if ((this.LimSuperiorField.Equals(value) != true)) {
                    this.LimSuperiorField = value;
                    this.RaisePropertyChanged("LimSuperior");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
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
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReference1.IAlumnosWCF")]
    public interface IAlumnosWCF {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAlumnosWCF/CalcularIMSS", ReplyAction="http://tempuri.org/IAlumnosWCF/CalcularIMSSResponse")]
        Negocio.ServiceReference1.AportacionesIMSS CalcularIMSS(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAlumnosWCF/CalcularIMSS", ReplyAction="http://tempuri.org/IAlumnosWCF/CalcularIMSSResponse")]
        System.Threading.Tasks.Task<Negocio.ServiceReference1.AportacionesIMSS> CalcularIMSSAsync(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAlumnosWCF/ItemTablaISR", ReplyAction="http://tempuri.org/IAlumnosWCF/ItemTablaISRResponse")]
        Negocio.ServiceReference1.ItemTablaISR ItemTablaISR(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAlumnosWCF/ItemTablaISR", ReplyAction="http://tempuri.org/IAlumnosWCF/ItemTablaISRResponse")]
        System.Threading.Tasks.Task<Negocio.ServiceReference1.ItemTablaISR> ItemTablaISRAsync(int id);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IAlumnosWCFChannel : Negocio.ServiceReference1.IAlumnosWCF, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class AlumnosWCFClient : System.ServiceModel.ClientBase<Negocio.ServiceReference1.IAlumnosWCF>, Negocio.ServiceReference1.IAlumnosWCF {
        
        public AlumnosWCFClient() {
        }
        
        public AlumnosWCFClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public AlumnosWCFClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AlumnosWCFClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AlumnosWCFClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public Negocio.ServiceReference1.AportacionesIMSS CalcularIMSS(int id) {
            return base.Channel.CalcularIMSS(id);
        }
        
        public System.Threading.Tasks.Task<Negocio.ServiceReference1.AportacionesIMSS> CalcularIMSSAsync(int id) {
            return base.Channel.CalcularIMSSAsync(id);
        }
        
        public Negocio.ServiceReference1.ItemTablaISR ItemTablaISR(int id) {
            return base.Channel.ItemTablaISR(id);
        }
        
        public System.Threading.Tasks.Task<Negocio.ServiceReference1.ItemTablaISR> ItemTablaISRAsync(int id) {
            return base.Channel.ItemTablaISRAsync(id);
        }
    }
}
