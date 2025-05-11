using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ElGamalKeyGenerationParameters : KeyGenerationParameters
	{
		private readonly ElGamalParameters parameters;

		public ElGamalParameters Parameters
		{
			get
			{
				return null;
			}
		}

		public ElGamalKeyGenerationParameters(SecureRandom random, ElGamalParameters parameters)
			: base(null, 0)
		{
		}

		internal static int GetStrength(ElGamalParameters parameters)
		{
			return 0;
		}
	}
}
