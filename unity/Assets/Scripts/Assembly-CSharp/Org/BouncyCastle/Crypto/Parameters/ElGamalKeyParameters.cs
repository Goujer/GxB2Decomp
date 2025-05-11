namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ElGamalKeyParameters : AsymmetricKeyParameter
	{
		private readonly ElGamalParameters parameters;

		public ElGamalParameters Parameters
		{
			get
			{
				return null;
			}
		}

		protected ElGamalKeyParameters(bool isPrivate, ElGamalParameters parameters)
			: base(false)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(ElGamalKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
