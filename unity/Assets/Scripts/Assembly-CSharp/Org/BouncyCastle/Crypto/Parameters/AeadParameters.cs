namespace Org.BouncyCastle.Crypto.Parameters
{
	public class AeadParameters : ICipherParameters
	{
		private readonly byte[] associatedText;

		private readonly byte[] nonce;

		private readonly KeyParameter key;

		private readonly int macSize;

		public virtual KeyParameter Key
		{
			get
			{
				return null;
			}
		}

		public virtual int MacSize
		{
			get
			{
				return 0;
			}
		}

		public AeadParameters(KeyParameter key, int macSize, byte[] nonce)
		{
		}

		public AeadParameters(KeyParameter key, int macSize, byte[] nonce, byte[] associatedText)
		{
		}

		public virtual byte[] GetAssociatedText()
		{
			return null;
		}

		public virtual byte[] GetNonce()
		{
			return null;
		}
	}
}
