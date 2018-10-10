using System;
using System.Collections.Generic;
using System.IdentityModel.Selectors;
using System.IdentityModel.Tokens;
using System.Security.Cryptography.X509Certificates;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;
using System.ServiceModel.Security;
using CrisisInterfere.AdvisoryStatisticsService;
using CrisisInterfere.AmountService;
using CrisisInterfere.AmountTypeService;
using CrisisInterfere.AnswerAddService;
using CrisisInterfere.AnswerStatusService;
using CrisisInterfere.BaseImportService;
using CrisisInterfere.BasicsDataService;
using CrisisInterfere.BasicSetting_UserInfo;
using CrisisInterfere.ChineseToPinYinService;
using CrisisInterfere.DepartmentService;
using CrisisInterfere.DistributeRecordService;
using CrisisInterfere.EnNmberService;
using CrisisInterfere.EnterpriseOnlineService;
using CrisisInterfere.FunctionService;
using CrisisInterfere.GroupReportService;
using CrisisInterfere.IndexService;
using CrisisInterfere.InspectionWarningService;
using CrisisInterfere.LetterService;
using CrisisInterfere.ParameterService;
using CrisisInterfere.PersonalReportService;
using CrisisInterfere.PresentationService;
using CrisisInterfere.RecycleBinService;
using CrisisInterfere.ReservationService;
using CrisisInterfere.RoleService;
using CrisisInterfere.RoleTypeService;
using CrisisInterfere.SpecialCalculationService;
using CrisisInterfere.StatisticalService;
using CrisisInterfere.SystemSettingService;
using CrisisInterfere.TestTypeService;
using CrisisInterfere.QuestionTypeService;
using CrisisInterfere.IndividualConsultationService;
using CrisisInterfere.QuestionnaireService;
using CrisisInterfere.AppointmentConsultService;
using CrisisInterfere.PotentialRiskEstimateService;
using CrisisInterfere.IdioctoniaEstimateService;
using CrisisInterfere.DiscriminateEstimateService;
using CrisisInterfere.DynamicEstimateService;
using System.Configuration;
using CrisisInterfere.MemberArchivesService;
using CrisisInterfere.WorkArchivesService;
using CrisisInterfere.CrisisInterfereSolutionService;
namespace BR_Service
{


    public class MyX509Validator : X509CertificateValidator
    {
        public override void Validate(X509Certificate2 certificate)
        {
            if (certificate == null)
                throw new ArgumentNullException("X509认证证书为空！");

            if (certificate.SubjectName.Name != "CN=JSBR200606adm")
                throw new SecurityTokenValidationException("Certificated was not issued by thrusted issuer");
        }
    }

    /// <summary>
    /// Class MgrServices.
    /// </summary>
    public class MgrServices
    {
        /// <summary>
        /// 服务地址
        /// </summary>


#if DEBUG

        private static String HttpService = "http://localhost:" + ConfigurationManager.AppSettings["WCFDataPort"].ToString() + "/BasicsServices/{0}/";



#else


        private static String HttpService = "http://localhost:"+ConfigurationManager.AppSettings["WCFDataPort"].ToString()+"/BasicsServices/{0}/";

#endif
        /// <summary>
        /// 主机DNS
        /// </summary>
        public const String dnsName = "JSBR200606adm";

        public static String CredentialsUi = "京师博仁,js@BR*2016+service.com";

        public static String CredentialsPwd = "j*s*b*r@216.com";


        /// <summary>
        /// 是否显示电话号码
        /// </summary>
        private static Dictionary<String, ChannelFactory> dicFactory = new Dictionary<String, ChannelFactory>();
        private static Dictionary<String, IClientChannel> dicChannel = new Dictionary<String, IClientChannel>();

        private static ChannelFactory CheckFactory(String url)
        {
            ChannelFactory cf;
            dicFactory.TryGetValue(url, out cf);
            if (null == cf) return null;
            Boolean result;
            try
            {
                result = cf.State == CommunicationState.Opened;
            }
            catch
            {
                result = false;
            }
            if (!result)
            {
                try
                {
                    cf.Abort();
                }
                catch
                {
                }
                dicFactory.Remove(url);
                cf = null;
            }
            return cf;
        }

        private static IClientChannel CheckService(String url)
        {
            IClientChannel cc;
            dicChannel.TryGetValue(url, out cc);
            if (null == cc) return null;
            Boolean result;
            try
            {
                result = cc.State == CommunicationState.Opened;
            }
            catch
            {
                result = false;
            }
            if (!result)
            {
                try
                {
                    cc.Abort();
                }
                catch
                { }
                dicChannel.Remove(url);
                cc = null;
            }
            return cc;
        }

        private static T GetServiceByFactory<T>(String service)
        {
            String URL = String.Format(HttpService, service);
            IClientChannel cc = CheckService(URL);
            if (cc != null) return (T)cc;
            ChannelFactory<T> factory = CheckFactory(URL) as ChannelFactory<T>;
            if (factory == null)
            {

                System.ServiceModel.Channels.AddressHeaderCollection ahc = new System.ServiceModel.Channels.AddressHeaderCollection();
                EndpointAddress EPD = new EndpointAddress(new Uri(URL), EndpointIdentity.CreateDnsIdentity(dnsName), ahc);
                WSHttpBinding wh = new WSHttpBinding(SecurityMode.Message);
                wh.Security.Message.ClientCredentialType = MessageCredentialType.UserName;
                wh.MaxBufferPoolSize = 2147483647;
                wh.MaxReceivedMessageSize = 2147483647;
                wh.ReaderQuotas.MaxArrayLength = 2147483647;
                wh.ReaderQuotas.MaxBytesPerRead = 2147483647;
                wh.ReaderQuotas.MaxDepth = 2147483647;
                wh.ReaderQuotas.MaxNameTableCharCount = 2147483647;
                wh.ReaderQuotas.MaxStringContentLength = 2147483647;
                wh.ReceiveTimeout = new TimeSpan(0, 2, 0);
                wh.ReliableSession.Enabled = true;
                wh.ReliableSession.InactivityTimeout = new TimeSpan(0, 1, 0);
                factory = new ChannelFactory<T>(wh, EPD);
                SetCredentials(factory.Credentials);
            }
            else
                factory = (ChannelFactory<T>)dicFactory[URL];
            T t = factory.CreateChannel();
            dicChannel.Remove(URL);
            dicChannel.Add(URL, (IClientChannel)t);
            return t;
        }

        private static T GetServiceByFactory<T>(String service, SecurityMode SM)
        {
            String URL = String.Format(HttpService, service);
            IClientChannel cc = CheckService(URL);
            if (cc != null) return (T)cc;
            ChannelFactory<T> factory = CheckFactory(URL) as ChannelFactory<T>;
            if (factory == null)
            {
                System.ServiceModel.Channels.AddressHeaderCollection ahc = new System.ServiceModel.Channels.AddressHeaderCollection();
                EndpointAddress EPD = new EndpointAddress(new Uri(URL), EndpointIdentity.CreateDnsIdentity(dnsName), ahc);
                WSHttpBinding wh = new WSHttpBinding(SM);
                wh.Security.Message.ClientCredentialType = MessageCredentialType.UserName;
                wh.MaxBufferPoolSize = 2147483647;
                wh.MaxReceivedMessageSize = 2147483647;
                wh.ReaderQuotas.MaxArrayLength = 2147483647;
                wh.ReaderQuotas.MaxBytesPerRead = 2147483647;
                wh.ReaderQuotas.MaxDepth = 2147483647;
                wh.ReaderQuotas.MaxNameTableCharCount = 2147483647;
                wh.ReaderQuotas.MaxStringContentLength = 2147483647;
                wh.ReceiveTimeout = new TimeSpan(0, 2, 0);
                wh.ReliableSession.InactivityTimeout = new TimeSpan(0, 1, 0);
                wh.ReliableSession.Enabled = true;
                factory = new ChannelFactory<T>(wh, EPD);
                if (SM == SecurityMode.Message) SetCredentials(factory.Credentials);
            }
            else
                factory = (ChannelFactory<T>)dicFactory[URL];
            T t = factory.CreateChannel();
            dicChannel.Remove(URL);
            dicChannel.Add(URL, (IClientChannel)t);
            return t;
        }

        private static Dictionary<String, IClientChannel> DicChannel = new Dictionary<String, IClientChannel>();

        private static T GetServiceByFactory<T>(String URL, string strUserName, string strPassword)
        {
            if (BCheckService(URL)) return (T)DicChannel[URL];
            ChannelFactory<T> factory = null;
            if (!BCheckFactory(URL))
            {
                AddressHeaderCollection ahc = new AddressHeaderCollection();
                EndpointAddress EPD = new EndpointAddress(new Uri(URL), EndpointIdentity.CreateDnsIdentity(dnsName), ahc);
                WSHttpBinding wh = new WSHttpBinding(SecurityMode.None);

                //wh.Security.Message.ClientCredentialType = MessageCredentialType.UserName;
                wh.MaxBufferPoolSize = 2147483647;
                wh.MaxReceivedMessageSize = 2147483647;
                wh.ReaderQuotas.MaxArrayLength = 2147483647;
                wh.ReaderQuotas.MaxBytesPerRead = 2147483647;
                wh.ReaderQuotas.MaxDepth = 2147483647;
                wh.ReaderQuotas.MaxNameTableCharCount = 2147483647;
                wh.ReaderQuotas.MaxStringContentLength = 2147483647;
                wh.ReceiveTimeout = new TimeSpan(0, 2, 0);
                wh.ReliableSession.InactivityTimeout = new TimeSpan(0, 1, 0);
                wh.ReliableSession.Enabled = true;
                factory = new ChannelFactory<T>(wh, EPD);
                factory.Credentials.ServiceCertificate.Authentication.CustomCertificateValidator = new MyX509Validator();
                factory.Credentials.ServiceCertificate.Authentication.CertificateValidationMode = X509CertificateValidationMode.Custom;
                factory.Credentials.UserName.UserName = strUserName;
                factory.Credentials.UserName.Password = strPassword;
                factory = new ChannelFactory<T>(wh, EPD);
                SetCredentialsByID(factory.Credentials, strUserName, strPassword);
            }
            else
                factory = (ChannelFactory<T>)dicFactory[URL];
            T t = factory.CreateChannel();
            DicChannel.Remove(URL);
            DicChannel.Add(URL, (IClientChannel)t);
            try
            {
                ((IClientChannel)t).Open();
            }
            catch
            {
            }
            return t;
        }


        private static Boolean BCheckService(String URL)
        {
            if (DicChannel == null || URL == null || !DicChannel.ContainsKey(URL)) return false;
            Boolean result = true;
            try
            {
                if (DicChannel[URL].State != CommunicationState.Opened)
                {
                    result = false;
                    DicChannel[URL].Abort();
                    DicChannel[URL] = null;
                    DicChannel.Remove(URL);
                }
            }
            catch
            {
                result = false;
            }
            return result;
        }

        private static Boolean BCheckFactory(String URL)
        {
            if (dicFactory == null || URL == null || !dicFactory.ContainsKey(URL)) return false;
            Boolean result = true;
            try
            {
                if (dicFactory[URL].State != CommunicationState.Opened)
                {
                    result = false;
                    dicFactory[URL].Abort();
                    dicFactory[URL] = null;
                    dicFactory.Remove(URL);
                }
            }
            catch
            {
                result = false;
            }
            return result;
        }


        private static void SetCredentialsByID(ClientCredentials Credentials, string strUserName, string strPassword)
        {
            Credentials.ServiceCertificate.Authentication.CustomCertificateValidator = new MyX509Validator();
            Credentials.ServiceCertificate.Authentication.CertificateValidationMode = System.ServiceModel.Security.X509CertificateValidationMode.Custom;
            Credentials.UserName.UserName = strUserName;
            Credentials.UserName.Password = strPassword;
        }




        private static void SetCredentials(ClientCredentials Credentials)
        {
            Credentials.ServiceCertificate.Authentication.CustomCertificateValidator = new MyX509Validator();
            Credentials.ServiceCertificate.Authentication.CertificateValidationMode = System.ServiceModel.Security.X509CertificateValidationMode.Custom;
            Credentials.UserName.UserName = CredentialsUi;
            Credentials.UserName.Password = CredentialsPwd;
        }


        /// <summary>
        /// 测试服务用例
        /// </summary>
        public static IBasicsDataService MgBasicService
        {
            get
            {
                return GetServiceByFactory<IBasicsDataService>("BasicsDataService");
            }
        }
        /// <summary>
        /// 添加单个用户信息
        /// </summary>
        public static IBasicSetting_UserInfo UserAddService
        {
            get
            {
                return GetServiceByFactory<IBasicSetting_UserInfo>("BasicSetting_UserInfo");
            }
        }

        /// <summary>
        /// 参数设置
        /// </summary>
        public static IParameterService ParameterService
        {
            get
            {
                return GetServiceByFactory<IParameterService>("ParameterService");
            }
        }


        /// <summary>
        /// 添加单个用户信息
        /// </summary>
        public static IAmountService AmountService
        {
            get
            {
                return GetServiceByFactory<IAmountService>("AmountService");
            }
        }


        /// <summary>
        /// 量表类别服务
        /// </summary>
        public static IAmountTypeService AmountTypeService
        {
            get
            {
                return GetServiceByFactory<IAmountTypeService>("AmountTypeService");
            }
        }

        /// <summary>
        /// 量表类别服务
        /// </summary>
        public static IAmountTypeService AmountTypeService2
        {
            get
            {
                return GetServiceByFactory<IAmountTypeService>("AmountTypeService");
            }
        }




        /// <summary>
        /// 部门管理
        /// </summary>
        public static IDepartmentService Department
        {
            get
            {
                return GetServiceByFactory<IDepartmentService>("DepartmentService");
            }
        }

        /// <summary>
        /// 问卷管理
        /// </summary>
        public static IQuestionnaireService QuestionnaireService
        {
            get
            {
                return GetServiceByFactory<IQuestionnaireService>("QuestionnaireService");
            }
        }
        /// <summary>
        /// 站内信
        /// </summary>
        public static ILetterService Letter
        {
            get
            {
                return GetServiceByFactory<ILetterService>("LetterService");
            }
        }



        /// <summary>
        /// 站内信
        /// </summary>
        public static IIndexService IndexService
        {
            get
            {
                return GetServiceByFactory<IIndexService>("IndexService");
            }
        }
        public static IAnswerStatusService AnswerStatusService
        {
            get
            {
                return GetServiceByFactory<IAnswerStatusService>("AnswerStatusService");
            }
        }
        public static IDistributeRecordService DistributeRecordService
        {
            get
            {
                return GetServiceByFactory<IDistributeRecordService>("DistributeRecordService");
            }
        }
        public static IReservationService ReservationService
        {
            get
            {
                return GetServiceByFactory<IReservationService>("ReservationService");
            }
        }


        public static ISystemSettingService SystemSettingService
        {
            get
            {
                return GetServiceByFactory<ISystemSettingService>("SystemSettingService");
            }
        }
        public static IPersonalReportService PersonalReportService
        {
            get
            {
                return GetServiceByFactory<IPersonalReportService>("PersonalReportService");
            }
        }
        public static IFunctionService FunctionService
        {
            get
            {
                return GetServiceByFactory<IFunctionService>("FunctionService");
            }
        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-31
        /// 功能介绍：将中文转化成拼音
        /// </summary>
        public static IChineseToPinYinService ChineseToPinYinService
        {
            get
            {
                return GetServiceByFactory<IChineseToPinYinService>("ChineseToPinYinService");
            }

        }
        /// <summary>
        /// 创建人:李超
        /// 创建时间:2016/11/4
        /// 功能介绍:答题记录服务
        /// </summary>
        public static IAnswerAddService AnswerAddService
        {
            get
            {
                return GetServiceByFactory<IAnswerAddService>("AnswerAddService");
            }

        }
        /// <summary>
        /// 创建人:李超
        /// 创建日期:2016/11/21
        /// 服务阐述:测试类型服务
        /// </summary>
        public static ITestTypeService TestTypeService
        {
            get
            {
                return GetServiceByFactory<ITestTypeService>("TestTypeService");
            }

        }
        /// <summary>
        /// 创建人:李超
        /// 创建日期:2016/11/7
        /// 服务介绍:回收站服务
        /// </summary>
        public static IRecycleBinService RecycleBinService
        {
            get
            {
                return GetServiceByFactory<IRecycleBinService>("RecycleBinService");
            }

        }
        public static IRoleService RoleService
        {
            get
            {
                return GetServiceByFactory<IRoleService>("RoleService");
            }

        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-31
        /// 功能介绍：将中文转化成拼音
        /// </summary>
        public static IPresentationService PresentationService
        {
            get
            {
                return GetServiceByFactory<IPresentationService>("PresentationService");
            }

        }
        /// <summary>
        /// 创建人:李超
        /// 创建时间:2016/11/21
        /// 方法阐述:角色类型服务
        /// </summary>
        public static IRoleTypeService RoleTypeService
        {
            get
            {
                return GetServiceByFactory<IRoleTypeService>("RoleTypeService");
            }

        }
        /// <summary>
        /// 创建人:李超
        /// 创建日期:2016/11/23
        /// 方法阐述:团体报告
        /// </summary>
        public static IGroupReportService GroupReportService
        {
            get
            {
                return GetServiceByFactory<IGroupReportService>("GroupReportService");
            }

        }
        /// <summary>
        /// 插入关系表
        /// </summary>
        public static IEnterpriseOnlineService EnterpriseOnlineService
        {
            get
            {
                return GetServiceByFactory<IEnterpriseOnlineService>("EnterpriseOnlineService");
            }

        }

        /// <summary>
        /// 预警基础服务
        /// </summary>
        public static IInspectionWarningService InspectionWarningService
        {
            get
            {
                return GetServiceByFactory<IInspectionWarningService>("InspectionWarningService");
            }

        }


        /// <summary>
        /// 基础配比数据服务
        /// </summary>
        public static IBaseImportService IBaseImportService
        {
            get
            {
                return GetServiceByFactory<IBaseImportService>("BaseImportService");
            }

        }


        /// <summary>
        /// 统计分析服务
        /// </summary>
        public static IStatisticalService StatisticalService
        {
            get
            {
                return GetServiceByFactory<IStatisticalService>("StatisticalService");
            }

        }
        /// <summary>
        /// 授权平台服务
        /// 创建人：刘亚娟
        /// 创建时间：2017/2/16
        /// </summary>

        public static IEnterpriseService EnNmberService
        {
            get
            {
                return GetServiceByFactory<IEnterpriseService>("EnterpriseService");
            }

        }

        /// <summary>
        /// 特殊量表报告生成服务
        /// </summary>
        public static ISpecialCalculationService SpecialCalculationService
        {
            get
            {
                return GetServiceByFactory<ISpecialCalculationService>("SpecialCalculationService");
            }

        }

        /// <summary> 问题类型服务 创建人：夏增文 创建时间：2017-03-20 </summary>
        public static IQuestionTypeService QuestionTypeService
        {
            get
            {
                return GetServiceByFactory<IQuestionTypeService>("QuestionTypeService");
            }

        }

        public static IAppointmentConsultService AppointmentConsultService
        {
            get
            {
                return GetServiceByFactory<IAppointmentConsultService>("AppointmentConsultService");
            }

        }

        /// <summary> 个体咨询服务 创建人：夏增文 创建时间：2017-03-30 </summary>
        public static IIndividualConsultationService IndividualConsultationService
        {
            get
            {
                return GetServiceByFactory<IIndividualConsultationService>("IndividualConsultationService");
            }

        }
        /// <summary>
        /// 咨询统计服务  创建人：田闯
        /// 创建时间：2017/5/4
        /// </summary>
        public static IAdvisoryStatisticsService AdvisoryStatisticsService
        {
            get
            {
                return GetServiceByFactory<IAdvisoryStatisticsService>("AdvisoryStatisticsService");
            }

        }

        public static CrisisInterfere.GroupConsultationService.IGroupConsultationService GroupConsultationService
        {
            get
            {
                return GetServiceByFactory<CrisisInterfere.GroupConsultationService.IGroupConsultationService>("GroupConsultationService");
            }

        }
        /// <summary>
        /// 在线咨询服务   创建人：仝日辉
        /// 创建时间： 2017/05/11 10：09
        /// </summary>
        public static CrisisInterfere.ConsultingOnlineService.IConsultingOnlineService ConsultingOnlineService
        {
            get
            {
                return GetServiceByFactory<CrisisInterfere.ConsultingOnlineService.IConsultingOnlineService>("ConsultingOnlineService");
            }

        }
        public static IPotentialRiskEstimateService PotentialRiskEstimateService
        {
            get
            {
                return GetServiceByFactory<IPotentialRiskEstimateService>("PotentialRiskEstimateService");
            }

        }
        public static IIdioctoniaEstimateService IdioctoniaEstimateService
        {
            get
            {
                return GetServiceByFactory<IIdioctoniaEstimateService>("IdioctoniaEstimateService");
            }

        }
        public static IDiscriminateEstimateService DiscriminateEstimateService
        {
            get
            {
                return GetServiceByFactory<IDiscriminateEstimateService>("DiscriminateEstimateService");
            }

        }
        public static IDynamicEstimateService DynamicEstimateService
        {
            get
            {
                return GetServiceByFactory<IDynamicEstimateService>("DynamicEstimateService");
            }

        }
        public static IMemberArchivesService MemberArchivesService
        {
            get
            {
                return GetServiceByFactory<IMemberArchivesService>("MemberArchivesService");
            }

        }
        public static IWorkArchivesService WorkArchivesService
        {
            get
            {
                return GetServiceByFactory<IWorkArchivesService>("WorkArchivesService");
            }

        }
        public static ICrisisInterfereSolutionService CrisisInterfereSolutionService
        {
            get
            {
                return GetServiceByFactory<ICrisisInterfereSolutionService>("CrisisInterfereSolutionService");
            }

        }
        /// <summary>
        /// 创建人:李超
        /// 创建时间:2016/11/21
        /// 服务阐述:创建权限功能服务
        /// </summary>
        /// <summary>
        /// 关闭所有服务
        /// </summary>
        public static void CloseServices()
        {
            try
            {
                foreach (IClientChannel cc in dicChannel.Values)
                {
                    try
                    {
                        cc.Abort();
                    }
                    catch
                    {
                    }
                }
                dicChannel.Clear();
                dicChannel = null;
                foreach (ChannelFactory cf in dicFactory.Values)
                {
                    try
                    {
                        cf.Abort();
                    }
                    catch
                    {
                    }
                }
                dicFactory.Clear();
                dicFactory = null;
            }
            catch
            { }
        }
    }
}
