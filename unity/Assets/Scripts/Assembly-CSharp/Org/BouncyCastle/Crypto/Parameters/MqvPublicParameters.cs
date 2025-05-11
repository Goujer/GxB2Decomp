namespace Org.BouncyCastle.Crypto.Parameters
{
	public class MqvPublicParameters : ICipherParameters
	{
		private readonly ECPublicKeyParameters staticPublicKey;

		private readonly ECPublicKeyParameters ephemeralPublicKey;

		public virtual ECPublicKeyParameters StaticPublicKey
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

		public MqvPublicParameters(ECPublicKeyParameters staticPublicKey, ECPublicKeyParameters ephemeralPublicKey)
		{
		}
	}
}
