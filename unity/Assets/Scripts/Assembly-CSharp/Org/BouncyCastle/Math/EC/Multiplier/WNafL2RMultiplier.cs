namespace Org.BouncyCastle.Math.EC.Multiplier
{
	public class WNafL2RMultiplier : AbstractECMultiplier
	{
		protected override ECPoint MultiplyPositive(ECPoint p, BigInteger k)
		{
			return null;
		}

		protected virtual int GetWindowSize(int bits)
		{
			return 0;
		}
	}
}
