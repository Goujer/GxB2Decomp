using Org.BouncyCastle.Math.Field;

namespace Org.BouncyCastle.Math.EC
{
	public abstract class AbstractF2mCurve : ECCurve
	{
		private BigInteger[] si;

		public virtual bool IsKoblitz
		{
			get
			{
				return false;
			}
		}

		protected AbstractF2mCurve(int m, int k1, int k2, int k3)
			: base(null)
		{
		}

		public static BigInteger Inverse(int m, int[] ks, BigInteger x)
		{
			return null;
		}

		private static IFiniteField BuildField(int m, int k1, int k2, int k3)
		{
			return null;
		}

		public override bool IsValidFieldElement(BigInteger x)
		{
			return false;
		}

		public override ECPoint CreatePoint(BigInteger x, BigInteger y, bool withCompression)
		{
			return null;
		}

		protected override ECPoint DecompressPoint(int yTilde, BigInteger X1)
		{
			return null;
		}

		private ECFieldElement SolveQuadradicEquation(ECFieldElement beta)
		{
			return null;
		}

		internal virtual BigInteger[] GetSi()
		{
			return null;
		}
	}
}
