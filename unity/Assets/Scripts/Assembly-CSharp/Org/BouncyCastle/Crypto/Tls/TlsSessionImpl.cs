namespace Org.BouncyCastle.Crypto.Tls
{
	internal class TlsSessionImpl : TlsSession
	{
		internal readonly byte[] mSessionID;

		internal SessionParameters mSessionParameters;

		public virtual byte[] SessionID
		{
			get
			{
				return null;
			}
		}

		public virtual bool IsResumable
		{
			get
			{
				return false;
			}
		}

		internal TlsSessionImpl(byte[] sessionID, SessionParameters sessionParameters)
		{
		}

		public virtual SessionParameters ExportSessionParameters()
		{
			return null;
		}

		public virtual void Invalidate()
		{
		}
	}
}
