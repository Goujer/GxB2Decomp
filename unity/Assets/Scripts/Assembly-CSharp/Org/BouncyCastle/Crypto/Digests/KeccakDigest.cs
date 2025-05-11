using Org.BouncyCastle.Utilities;

namespace Org.BouncyCastle.Crypto.Digests
{
	public class KeccakDigest : IDigest, IMemoable
	{
		private static readonly ulong[] KeccakRoundConstants;

		private static readonly int[] KeccakRhoOffsets;

		protected byte[] state;

		protected byte[] dataQueue;

		protected int rate;

		protected int bitsInQueue;

		protected int fixedOutputLength;

		protected bool squeezing;

		protected int bitsAvailableForSqueezing;

		protected byte[] chunk;

		protected byte[] oneByte;

		private ulong[] C;

		private ulong[] tempA;

		private ulong[] chiC;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public KeccakDigest()
		{
		}

		public KeccakDigest(int bitLength)
		{
		}

		public KeccakDigest(KeccakDigest source)
		{
		}

		private static ulong[] KeccakInitializeRoundConstants()
		{
			return null;
		}

		private static int[] KeccakInitializeRhoOffsets()
		{
			return null;
		}

		private void ClearDataQueueSection(int off, int len)
		{
		}

		private void CopyIn(KeccakDigest source)
		{
		}

		public virtual int GetDigestSize()
		{
			return 0;
		}

		public virtual void Update(byte input)
		{
		}

		public virtual void BlockUpdate(byte[] input, int inOff, int len)
		{
		}

		public virtual int DoFinal(byte[] output, int outOff)
		{
			return 0;
		}

		protected virtual int DoFinal(byte[] output, int outOff, byte partialByte, int partialBits)
		{
			return 0;
		}

		public virtual void Reset()
		{
		}

		public virtual int GetByteLength()
		{
			return 0;
		}

		private void Init(int bitLength)
		{
		}

		private void InitSponge(int rate, int capacity)
		{
		}

		private void AbsorbQueue()
		{
		}

		protected virtual void Absorb(byte[] data, int off, long databitlen)
		{
		}

		private void PadAndSwitchToSqueezingPhase()
		{
		}

		protected virtual void Squeeze(byte[] output, int offset, long outputLength)
		{
		}

		private static void FromBytesToWords(ulong[] stateAsWords, byte[] state)
		{
		}

		private static void FromWordsToBytes(byte[] state, ulong[] stateAsWords)
		{
		}

		private void KeccakPermutation(byte[] state)
		{
		}

		private void KeccakPermutationAfterXor(byte[] state, byte[] data, int dataLengthInBytes)
		{
		}

		private void KeccakPermutationOnWords(ulong[] state)
		{
		}

		private void Theta(ulong[] A)
		{
		}

		private void Rho(ulong[] A)
		{
		}

		private void Pi(ulong[] A)
		{
		}

		private void Chi(ulong[] A)
		{
		}

		private static void Iota(ulong[] A, int indexRound)
		{
		}

		private void KeccakAbsorb(byte[] byteState, byte[] data, int dataInBytes)
		{
		}

		private void KeccakExtract1024bits(byte[] byteState, byte[] data)
		{
		}

		private void KeccakExtract(byte[] byteState, byte[] data, int laneCount)
		{
		}

		public virtual IMemoable Copy()
		{
			return null;
		}

		public virtual void Reset(IMemoable other)
		{
		}
	}
}
