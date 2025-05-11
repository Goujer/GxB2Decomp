namespace Org.BouncyCastle.Math.EC.Multiplier
{
	public class FixedPointPreCompInfo : PreCompInfo
	{
		protected ECPoint[] m_preComp;

		protected int m_width;

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

		public virtual int Width
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}
	}
}
