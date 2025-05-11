namespace Org.BouncyCastle.Math.EC.Endo
{
	public class GlvTypeBEndomorphism : GlvEndomorphism, ECEndomorphism
	{
		protected readonly ECCurve m_curve;

		protected readonly GlvTypeBParameters m_parameters;

		protected readonly ECPointMap m_pointMap;

		public virtual ECPointMap PointMap
		{
			get
			{
				return null;
			}
		}

		public virtual bool HasEfficientPointMap
		{
			get
			{
				return false;
			}
		}

		public GlvTypeBEndomorphism(ECCurve curve, GlvTypeBParameters parameters)
		{
		}

		public virtual BigInteger[] DecomposeScalar(BigInteger k)
		{
			return null;
		}

		protected virtual BigInteger CalculateB(BigInteger k, BigInteger g, int t)
		{
			return null;
		}
	}
}
