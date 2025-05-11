namespace Org.BouncyCastle.Math.EC.Multiplier
{
	public class FixedPointCombMultiplier : AbstractECMultiplier
	{
		protected override ECPoint MultiplyPositive(ECPoint p, BigInteger k)
		{
			return null;
		}

		protected virtual int GetWidthForCombSize(int combSize)
		{
			return 0;
		}
	}
}
