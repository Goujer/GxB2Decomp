namespace Org.BouncyCastle.Crypto.Parameters
{
	public class MqvPrivateParameters : ICipherParameters
	{
		private readonly ECPrivateKeyParameters staticPrivateKey;

		private readonly ECPrivateKeyParameters ephemeralPrivateKey;

		private readonly ECPublicKeyParameters ephemeralPublicKey;

		public virtual ECPrivateKeyParameters StaticPrivateKey
		{
			get
			{
				return null;
			}
		}

		public virtual ECPrivateKeyParameters EphemeralPrivateKey
		{
			get
			{
				return null;
			}
		}

		public virtual ECPublicKeyParameters EphemeralPublicKey
		{
			get
			{
				return null;
			}
		}

		public MqvPrivateParameters(ECPrivateKeyParameters staticPrivateKey, ECPrivateKeyParameters ephemeralPrivateKey)
		{
		}

		public MqvPrivateParameters(ECPrivateKeyParameters staticPrivateKey, ECPrivateKeyParameters ephemeralPrivateKey, ECPublicKeyParameters ephemeralPublicKey)
		{
		}
	}
}
