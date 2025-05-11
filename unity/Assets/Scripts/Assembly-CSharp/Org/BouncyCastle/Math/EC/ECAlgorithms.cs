using Org.BouncyCastle.Math.EC.Endo;
using Org.BouncyCastle.Math.EC.Multiplier;
using Org.BouncyCastle.Math.Field;

namespace Org.BouncyCastle.Math.EC
{
	public class ECAlgorithms
	{
		public static bool IsF2mCurve(ECCurve c)
		{
			return false;
		}

		public static bool IsF2mField(IFiniteField field)
		{
			return false;
		}

		public static bool IsFpCurve(ECCurve c)
		{
			return false;
		}

		public static bool IsFpField(IFiniteField field)
		{
			return false;
		}

		public static ECPoint SumOfMultiplies(ECPoint[] ps, BigInteger[] ks)
		{
			return null;
		}

		public static ECPoint SumOfTwoMultiplies(ECPoint P, BigInteger a, ECPoint Q, BigInteger b)
		{
			return null;
		}

		public static ECPoint ShamirsTrick(ECPoint P, BigInteger k, ECPoint Q, BigInteger l)
		{
			return null;
		}

		public static ECPoint ImportPoint(ECCurve c, ECPoint p)
		{
			return null;
		}

		public static void MontgomeryTrick(ECFieldElement[] zs, int off, int len)
		{
		}

		public static void MontgomeryTrick(ECFieldElement[] zs, int off, int len, ECFieldElement scale)
		{
		}

		public static ECPoint ReferenceMultiply(ECPoint p, BigInteger k)
		{
			return null;
		}

		public static ECPoint ValidatePoint(ECPoint p)
		{
			return null;
		}

		internal static ECPoint ImplShamirsTrickJsf(ECPoint P, BigInteger k, ECPoint Q, BigInteger l)
		{
			return null;
		}

		internal static ECPoint ImplShamirsTrickWNaf(ECPoint P, BigInteger k, ECPoint Q, BigInteger l)
		{
			return null;
		}

		internal static ECPoint ImplShamirsTrickWNaf(ECPoint P, BigInteger k, ECPointMap pointMapQ, BigInteger l)
		{
			return null;
		}

		private static ECPoint ImplShamirsTrickWNaf(ECPoint[] preCompP, ECPoint[] preCompNegP, byte[] wnafP, ECPoint[] preCompQ, ECPoint[] preCompNegQ, byte[] wnafQ)
		{
			return null;
		}

		internal static ECPoint ImplSumOfMultiplies(ECPoint[] ps, BigInteger[] ks)
		{
			return null;
		}

		internal static ECPoint ImplSumOfMultipliesGlv(ECPoint[] ps, BigInteger[] ks, GlvEndomorphism glvEndomorphism)
		{
			return null;
		}

		internal static ECPoint ImplSumOfMultiplies(ECPoint[] ps, ECPointMap pointMap, BigInteger[] ks)
		{
			return null;
		}

		private static ECPoint ImplSumOfMultiplies(bool[] negs, WNafPreCompInfo[] infos, byte[][] wnafs)
		{
			return null;
		}
	}
}
