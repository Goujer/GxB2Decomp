using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class TlsBlockCipher : TlsCipher
	{
		protected readonly TlsContext context;

		protected readonly byte[] randomData;

		protected readonly bool useExplicitIV;

		protected readonly bool encryptThenMac;

		protected readonly IBlockCipher encryptCipher;

		protected readonly IBlockCipher decryptCipher;

		protected readonly TlsMac mWriteMac;

		protected readonly TlsMac mReadMac;

		public virtual TlsMac WriteMac
		{
			get
			{
				return null;
			}
		}

		public virtual TlsMac ReadMac
		{
			get
			{
				return null;
			}
		}

		public TlsBlockCipher(TlsContext context, IBlockCipher clientWriteCipher, IBlockCipher serverWriteCipher, IDigest clientWriteDigest, IDigest serverWriteDigest, int cipherKeySize)
		{
		}

		public virtual int GetPlaintextLimit(int ciphertextLimit)
		{
			return 0;
		}

		public virtual byte[] EncodePlaintext(long seqNo, byte type, byte[] plaintext, int offset, int len)
		{
			return null;
		}

		public virtual byte[] DecodeCiphertext(long seqNo, byte type, byte[] ciphertext, int offset, int len)
		{
			return null;
		}

		protected virtual int CheckPaddingConstantTime(byte[] buf, int off, int len, int blockSize, int macSize)
		{
			return 0;
		}

		protected virtual int ChooseExtraPadBlocks(SecureRandom r, int max)
		{
			return 0;
		}

		protected virtual int LowestBitSet(int x)
		{
			return 0;
		}
	}
}
