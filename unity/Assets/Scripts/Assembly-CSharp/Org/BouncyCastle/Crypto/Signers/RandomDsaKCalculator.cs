using Org.BouncyCastle.Math;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Signers
{
	public class RandomDsaKCalculator : IDsaKCalculator
	{
		private BigInteger q;

		private SecureRandom random;

		public virtual bool IsDeterministic
		{
			get
			{
				return false;
			}
		}

		public virtual void Init(BigInteger n, SecureRandom random)
		{
		}

		public virtual void Init(BigInteger n, BigInteger d, byte[] message)
		{
		}

		public virtual BigInteger NextK()
		{
			return null;
		}
	}
}
