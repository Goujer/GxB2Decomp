namespace Org.BouncyCastle.Math.Field
{
	internal class GF2Polynomial : IPolynomial
	{
		protected readonly int[] exponents;

		public virtual int Degree
		{
			get
			{
				return 0;
			}
		}

		internal GF2Polynomial(int[] exponents)
		{
		}

		public virtual int[] GetExponentsPresent()
		{
			return null;
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
