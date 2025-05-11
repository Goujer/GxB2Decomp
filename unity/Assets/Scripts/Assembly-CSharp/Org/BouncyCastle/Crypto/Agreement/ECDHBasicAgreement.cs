using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Agreement
{
	public class ECDHBasicAgreement : IBasicAgreement
	{
		protected internal ECPrivateKeyParameters privKey;

		public virtual void Init(ICipherParameters parameters)
		{
		}

		public virtual int GetFieldSize()
		{
			return 0;
		}

		public virtual BigInteger CalculateAgreement(ICipherParameters pubKey)
		{
			return null;
		}
	}
}
