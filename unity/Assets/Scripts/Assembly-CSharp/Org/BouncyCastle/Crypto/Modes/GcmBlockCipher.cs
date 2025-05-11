using Org.BouncyCastle.Crypto.Modes.Gcm;

namespace Org.BouncyCastle.Crypto.Modes
{
	public class GcmBlockCipher : IAeadBlockCipher
	{
		private const int BlockSize = 16;

		private readonly IBlockCipher cipher;

		private readonly IGcmMultiplier multiplier;

		private IGcmExponentiator exp;

		private bool forEncryption;

		private int macSize;

		private byte[] nonce;

		private byte[] initialAssociatedText;

		private byte[] H;

		private byte[] J0;

		private byte[] bufBlock;

		private byte[] macBlock;

		private byte[] S;

		private byte[] S_at;

		private byte[] S_atPre;

		private byte[] counter;

		private uint blocksRemaining;

		private int bufOff;

		private ulong totalLength;

		private byte[] atBlock;

		private int atBlockPos;

		private ulong atLength;

		private ulong atLengthPre;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public GcmBlockCipher(IBlockCipher c)
		{
		}

		public GcmBlockCipher(IBlockCipher c, IGcmMultiplier m)
		{
		}

		public IBlockCipher GetUnderlyingCipher()
		{
			return null;
		}

		public virtual int GetBlockSize()
		{
			return 0;
		}

		public virtual void Init(bool forEncryption, ICipherParameters parameters)
		{
		}

		public virtual byte[] GetMac()
		{
			return null;
		}

		public virtual int GetOutputSize(int len)
		{
			return 0;
		}

		public virtual int GetUpdateOutputSize(int len)
		{
			return 0;
		}

		public virtual void ProcessAadByte(byte input)
		{
		}

		public virtual void ProcessAadBytes(byte[] inBytes, int inOff, int len)
		{
		}

		private void InitCipher()
		{
		}

		public virtual int ProcessByte(byte input, byte[] output, int outOff)
		{
			return 0;
		}

		public virtual int ProcessBytes(byte[] input, int inOff, int len, byte[] output, int outOff)
		{
			return 0;
		}

		private void OutputBlock(byte[] output, int offset)
		{
		}

		public int DoFinal(byte[] output, int outOff)
		{
			return 0;
		}

		public virtual void Reset()
		{
		}

		private void Reset(bool clearMac)
		{
		}

		private void gCTRBlock(byte[] block, byte[] output, int outOff)
		{
		}

		private void gCTRPartial(byte[] buf, int off, int len, byte[] output, int outOff)
		{
		}

		private void gHASH(byte[] Y, byte[] b, int len)
		{
		}

		private void gHASHBlock(byte[] Y, byte[] b)
		{
		}

		private void gHASHPartial(byte[] Y, byte[] b, int off, int len)
		{
		}

		private byte[] GetNextCounterBlock()
		{
			return null;
		}
	}
}
