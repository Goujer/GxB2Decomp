namespace Org.BouncyCastle.Math.Field
{
	internal class GenericPolynomialExtensionField : IPolynomialExtensionField, IExtensionField, IFiniteField
	{
		protected readonly IFiniteField subfield;

		protected readonly IPolynomial minimalPolynomial;

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

		public virtual IFiniteField Subfield
		{
			get
			{
				return null;
			}
		}

		public virtual int Degree
		{
			get
			{
				return 0;
			}
		}

		public virtual IPolynomial MinimalPolynomial
		{
			get
			{
				return null;
			}
		}

		internal GenericPolynomialExtensionField(IFiniteField subfield, IPolynomial polynomial)
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
