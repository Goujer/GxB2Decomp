namespace Org.BouncyCastle.Crypto
{
	public class AsymmetricCipherKeyPair
	{
		private readonly AsymmetricKeyParameter publicParameter;

		private readonly AsymmetricKeyParameter privateParameter;

		public AsymmetricKeyParameter Public
		{
			get
			{
				return null;
			}
		}

		public AsymmetricKeyParameter Private
		{
			get
			{
				return null;
			}
		}

		public AsymmetricCipherKeyPair(AsymmetricKeyParameter publicParameter, AsymmetricKeyParameter privateParameter)
		{
		}
	}
}
