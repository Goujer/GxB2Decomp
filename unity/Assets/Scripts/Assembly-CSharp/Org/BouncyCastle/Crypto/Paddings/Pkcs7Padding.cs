using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Paddings
{
	public class Pkcs7Padding : IBlockCipherPadding
	{
		public string PaddingName
		{
			get
			{
				return null;
			}
		}

		public void Init(SecureRandom random)
		{
		}

		public int AddPadding(byte[] input, int inOff)
		{
			return 0;
		}

		public int PadCount(byte[] input)
		{
			return 0;
		}
	}
}
