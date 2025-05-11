namespace Org.BouncyCastle.Math.EC.Endo
{
	public class GlvTypeBParameters
	{
		protected readonly BigInteger m_beta;

		protected readonly BigInteger m_lambda;

		protected readonly BigInteger[] m_v1;

		protected readonly BigInteger[] m_v2;

		protected readonly BigInteger m_g1;

		protected readonly BigInteger m_g2;

		protected readonly int m_bits;

		public virtual BigInteger Beta
		{
			get
			{
				return null;
			}
		}

		public virtual BigInteger Lambda
		{
			get
			{
				return null;
			}
		}

		public virtual BigInteger[] V1
		{
			get
			{
				return null;
			}
		}

		public virtual BigInteger[] V2
		{
			get
			{
				return null;
			}
		}

		public virtual BigInteger G1
		{
			get
			{
				return null;
			}
		}

		public virtual BigInteger G2
		{
			get
			{
				return null;
			}
		}

		public virtual int Bits
		{
			get
			{
				return 0;
			}
		}

		public GlvTypeBParameters(BigInteger beta, BigInteger lambda, BigInteger[] v1, BigInteger[] v2, BigInteger g1, BigInteger g2, int bits)
		{
		}
	}
}
