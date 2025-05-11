using System.Collections;
using System.Collections.Generic;

namespace Org.BouncyCastle.Crypto.Tls
{
	public abstract class AbstractTlsClient : AbstractTlsPeer, TlsClient, TlsPeer
	{
		protected TlsCipherFactory mCipherFactory;

		protected TlsClientContext mContext;

		protected IList mSupportedSignatureAlgorithms;

		protected int[] mNamedCurves;

		protected byte[] mClientECPointFormats;

		protected byte[] mServerECPointFormats;

		protected int mSelectedCipherSuite;

		protected short mSelectedCompressionMethod;

		public List<string> HostNames { get; set; }

		public virtual ProtocolVersion ClientHelloRecordLayerVersion
		{
			get
			{
				return null;
			}
		}

		public virtual ProtocolVersion ClientVersion
		{
			get
			{
				return null;
			}
		}

		public virtual bool IsFallback
		{
			get
			{
				return false;
			}
		}

		public virtual ProtocolVersion MinimumVersion
		{
			get
			{
				return null;
			}
		}

		public AbstractTlsClient()
		{
		}

		public AbstractTlsClient(TlsCipherFactory cipherFactory)
		{
		}

		protected virtual bool AllowUnexpectedServerExtension(int extensionType, byte[] extensionData)
		{
			return false;
		}

		protected virtual void CheckForUnexpectedServerExtension(IDictionary serverExtensions, int extensionType)
		{
		}

		public virtual void Init(TlsClientContext context)
		{
		}

		public virtual TlsSession GetSessionToResume()
		{
			return null;
		}

		public virtual IDictionary GetClientExtensions()
		{
			return null;
		}

		public virtual void NotifyServerVersion(ProtocolVersion serverVersion)
		{
		}

		public abstract int[] GetCipherSuites();

		public virtual byte[] GetCompressionMethods()
		{
			return null;
		}

		public virtual void NotifySessionID(byte[] sessionID)
		{
		}

		public virtual void NotifySelectedCipherSuite(int selectedCipherSuite)
		{
		}

		public virtual void NotifySelectedCompressionMethod(byte selectedCompressionMethod)
		{
		}

		public virtual void ProcessServerExtensions(IDictionary serverExtensions)
		{
		}

		public virtual void ProcessServerSupplementalData(IList serverSupplementalData)
		{
		}

		public abstract TlsKeyExchange GetKeyExchange();

		public abstract TlsAuthentication GetAuthentication();

		public virtual IList GetClientSupplementalData()
		{
			return null;
		}

		public override TlsCompression GetCompression()
		{
			return null;
		}

		public override TlsCipher GetCipher()
		{
			return null;
		}

		public virtual void NotifyNewSessionTicket(NewSessionTicket newSessionTicket)
		{
		}
	}
}
