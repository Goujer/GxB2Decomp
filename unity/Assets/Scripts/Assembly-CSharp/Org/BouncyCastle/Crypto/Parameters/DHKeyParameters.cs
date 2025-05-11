using Org.BouncyCastle.Asn1;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DHKeyParameters : AsymmetricKeyParameter
	{
		private readonly DHParameters parameters;

		private readonly DerObjectIdentifier algorithmOid;

		public DHParameters Parameters
		{
			get
			{
				return null;
			}
		}

		public DerObjectIdentifier AlgorithmOid
		{
			get
			{
				return null;
			}
		}

		protected DHKeyParameters(bool isPrivate, DHParameters parameters)
			: base(false)
		{
		}

		protected DHKeyParameters(bool isPrivate, DHParameters parameters, DerObjectIdentifier algorithmOid)
			: base(false)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(DHKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
