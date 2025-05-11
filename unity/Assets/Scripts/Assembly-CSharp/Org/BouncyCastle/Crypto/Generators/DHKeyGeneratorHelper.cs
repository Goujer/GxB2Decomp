using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Math;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Generators
{
	internal class DHKeyGeneratorHelper
	{
		internal static readonly DHKeyGeneratorHelper Instance;

		private DHKeyGeneratorHelper()
		{
		}

		internal BigInteger CalculatePrivate(DHParameters dhParams, SecureRandom random)
		{
			return null;
		}

		internal BigInteger CalculatePublic(DHParameters dhParams, BigInteger x)
		{
			return null;
		}
	}
}
