using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Crypto.Generators
{
	public class ElGamalKeyPairGenerator : IAsymmetricCipherKeyPairGenerator
	{
		private ElGamalKeyGenerationParameters param;

		public void Init(KeyGenerationParameters parameters)
		{
		}

		public AsymmetricCipherKeyPair GenerateKeyPair()
		{
			return null;
		}
	}
}
