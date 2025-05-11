using Org.BouncyCastle.Crypto.Macs;
using Org.BouncyCastle.Math;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Signers
{
	public class HMacDsaKCalculator : IDsaKCalculator
	{
		private readonly HMac hMac;

		private readonly byte[] K;

		private readonly byte[] V;

		private BigInteger n;

		public virtual bool IsDeterministic
		{
			get
			{
				return false;
			}
		}

		public HMacDsaKCalculator(IDigest digest)
		{
		}

		public virtual void Init(BigInteger n, SecureRandom random)
		{
		}

		public void Init(BigInteger n, BigInteger d, byte[] message)
		{
		}

		public virtual BigInteger NextK()
		{
			return null;
		}

		private BigInteger BitsToInt(byte[] t)
		{
			return null;
		}
	}
}
