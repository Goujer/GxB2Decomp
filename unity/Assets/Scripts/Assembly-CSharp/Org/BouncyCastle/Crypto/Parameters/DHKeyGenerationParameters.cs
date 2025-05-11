using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DHKeyGenerationParameters : KeyGenerationParameters
	{
		private readonly DHParameters parameters;

		public DHParameters Parameters
		{
			get
			{
				return null;
			}
		}

		public DHKeyGenerationParameters(SecureRandom random, DHParameters parameters)
			: base(null, 0)
		{
		}

		internal static int GetStrength(DHParameters parameters)
		{
			return 0;
		}
	}
}
