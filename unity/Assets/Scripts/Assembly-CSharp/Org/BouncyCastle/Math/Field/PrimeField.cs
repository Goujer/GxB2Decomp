namespace Org.BouncyCastle.Math.Field
{
	internal class PrimeField : IFiniteField
	{
		protected readonly BigInteger characteristic;

		public virtual BigInteger Characteristic
		{
			get
			{
				return null;
			}
		}

		public virtual int Dimension
		{
			get
			{
				return 0;
			}
		}

		internal PrimeField(BigInteger characteristic)
		{
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
