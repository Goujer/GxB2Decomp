namespace Org.BouncyCastle.Math.EC.Multiplier
{
	public class WNafPreCompInfo : PreCompInfo
	{
		protected ECPoint[] m_preComp;

		protected ECPoint[] m_preCompNeg;

		protected ECPoint m_twice;

		public virtual ECPoint[] PreComp
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public virtual ECPoint[] PreCompNeg
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public virtual ECPoint Twice
		{
			get
			{
				return null;
			}
			set
			{
			}
		}
	}
}
