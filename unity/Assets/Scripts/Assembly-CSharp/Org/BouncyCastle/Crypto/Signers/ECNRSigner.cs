using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Math;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Signers
{
	public class ECNRSigner : IDsa
	{
		private bool forSigning;

		private ECKeyParameters key;

		private SecureRandom random;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public virtual void Init(bool forSigning, ICipherParameters parameters)
		{
		}

		public virtual BigInteger[] GenerateSignature(byte[] message)
		{
			return null;
		}

		public virtual bool VerifySignature(byte[] message, BigInteger r, BigInteger s)
		{
			return false;
		}
	}
}
