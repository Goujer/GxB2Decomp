using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DsaKeyGenerationParameters : KeyGenerationParameters
	{
		private readonly DsaParameters parameters;

		public DsaParameters Parameters
		{
			get
			{
				return null;
			}
		}

		public DsaKeyGenerationParameters(SecureRandom random, DsaParameters parameters)
			: base(null, 0)
		{
		}
	}
}
