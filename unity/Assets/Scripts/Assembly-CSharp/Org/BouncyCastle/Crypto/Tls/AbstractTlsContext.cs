using Org.BouncyCastle.Crypto.Prng;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Tls
{
	internal abstract class AbstractTlsContext : TlsContext
	{
		private static long counter;

		private readonly IRandomGenerator mNonceRandom;

		private readonly SecureRandom mSecureRandom;

		private readonly SecurityParameters mSecurityParameters;

		private ProtocolVersion mClientVersion;

		private ProtocolVersion mServerVersion;

		private TlsSession mSession;

		private object mUserObject;

		public virtual IRandomGenerator NonceRandomGenerator
		{
			get
			{
				return null;
			}
		}

		public virtual SecureRandom SecureRandom
		{
			get
			{
				return null;
			}
		}

		public virtual SecurityParameters SecurityParameters
		{
			get
			{
				return null;
			}
		}

		public abstract bool IsServer { get; }

		public virtual ProtocolVersion ClientVersion
		{
			get
			{
				return null;
			}
		}

		public virtual ProtocolVersion ServerVersion
		{
			get
			{
				return null;
			}
		}

		public virtual TlsSession ResumableSession
		{
			get
			{
				return null;
			}
		}

		public virtual object UserObject
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		internal AbstractTlsContext(SecureRandom secureRandom, SecurityParameters securityParameters)
		{
		}

		private static long NextCounterValue()
		{
			return 0L;
		}

		internal virtual void SetClientVersion(ProtocolVersion clientVersion)
		{
		}

		internal virtual void SetServerVersion(ProtocolVersion serverVersion)
		{
		}

		internal virtual void SetResumableSession(TlsSession session)
		{
		}

		public virtual byte[] ExportKeyingMaterial(string asciiLabel, byte[] context_value, int length)
		{
			return null;
		}
	}
}
