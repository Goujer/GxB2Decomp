using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Crypto.Generators
{
	public class DHKeyPairGenerator : IAsymmetricCipherKeyPairGenerator
	{
		private DHKeyGenerationParameters param;

		public virtual void Init(KeyGenerationParameters parameters)
		{
		}

		public virtual AsymmetricCipherKeyPair GenerateKeyPair()
		{
			return null;
		}
	}
}
