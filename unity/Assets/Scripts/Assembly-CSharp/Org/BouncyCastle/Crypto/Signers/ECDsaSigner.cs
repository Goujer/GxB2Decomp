using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Math;
using Org.BouncyCastle.Math.EC;
using Org.BouncyCastle.Math.EC.Multiplier;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Signers
{
	public class ECDsaSigner : IDsa
	{
		private static readonly BigInteger Eight;

		protected readonly IDsaKCalculator kCalculator;

		protected ECKeyParameters key;

		protected SecureRandom random;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public ECDsaSigner()
		{
		}

		public ECDsaSigner(IDsaKCalculator kCalculator)
		{
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

		protected virtual BigInteger CalculateE(BigInteger n, byte[] message)
		{
			return null;
		}

		protected virtual ECMultiplier CreateBasePointMultiplier()
		{
			return null;
		}

		protected virtual ECFieldElement GetDenominator(int coordinateSystem, ECPoint p)
		{
			return null;
		}

		protected virtual SecureRandom InitSecureRandom(bool needed, SecureRandom provided)
		{
			return null;
		}
	}
}
