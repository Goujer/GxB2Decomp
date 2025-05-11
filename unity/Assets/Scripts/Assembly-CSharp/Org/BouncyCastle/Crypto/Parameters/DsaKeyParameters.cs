namespace Org.BouncyCastle.Crypto.Parameters
{
	public abstract class DsaKeyParameters : AsymmetricKeyParameter
	{
		private readonly DsaParameters parameters;

		public DsaParameters Parameters
		{
			get
			{
				return null;
			}
		}

		protected DsaKeyParameters(bool isPrivate, DsaParameters parameters)
			: base(false)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(DsaKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
