using Org.BouncyCastle.Math.EC.Abc;

namespace Org.BouncyCastle.Math.EC.Multiplier
{
	public class WTauNafMultiplier : AbstractECMultiplier
	{
		internal static readonly string PRECOMP_NAME;

		protected override ECPoint MultiplyPositive(ECPoint point, BigInteger k)
		{
			return null;
		}

		private AbstractF2mPoint MultiplyWTnaf(AbstractF2mPoint p, ZTauElement lambda, PreCompInfo preCompInfo, sbyte a, sbyte mu)
		{
			return null;
		}

		private static AbstractF2mPoint MultiplyFromWTnaf(AbstractF2mPoint p, sbyte[] u, PreCompInfo preCompInfo)
		{
			return null;
		}
	}
}
