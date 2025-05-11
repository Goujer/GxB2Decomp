namespace Org.BouncyCastle.Asn1.X9
{
	public class X962Parameters : Asn1Encodable, IAsn1Choice
	{
		private readonly Asn1Object _params;

		public bool IsNamedCurve
		{
			get
			{
				return false;
			}
		}

		public bool IsImplicitlyCA
		{
			get
			{
				return false;
			}
		}

		public Asn1Object Parameters
		{
			get
			{
				return null;
			}
		}

		public X962Parameters(X9ECParameters ecParameters)
		{
		}

		public X962Parameters(DerObjectIdentifier namedCurve)
		{
		}

		public X962Parameters(Asn1Object obj)
		{
		}

		public static X962Parameters GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
