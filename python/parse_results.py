"""
"""
import argparse
import numpy as np


def main(fname, limit):
	"""
	"""
	lines = None
	with open(fname) as f:
		lines = f.readlines()

	t = []
	a = []
	b = []
	c = []
	s = []
	state = 'HEADER'
	for line in lines:
		# Check state
		if state == 'HEADER':
			# Look for pattern keyword
			if 'PATTERN' in line:
				state = 'DATA'

		elif state == 'DATA':
			# Pattern ends in semicolon
			if t and t[-1] >= limit or ';' in line:
				state = 'DONE'
				break

			# Split string
			t_, line = line.split('>')
			line, s_ = line.split('=')
			a_, b_, c_ = line.split()

			# Convert to float and append
			t.append(float(t_.strip()))
			if 'X' not in a_:
				a.append(int(a_.strip(), 16))
			if 'X' not in b_:
				b.append(int(b_.strip(), 16))	
			if 'X' not in c_:
				c.append(int(c_.strip(), 16))
			if 'X' not in s_:
				s.append(int(s_.strip(), 16))

	if state != 'DONE':
		raise RuntimeError('Badness')

	tint = np.diff(t)

	sb = []
	for i in range(0, 33):
		bits = []
		for output in s:
			bits.append((output >> i) & 1)
		sb.append(bits)

	for i, bits in reversed(list(enumerate(sb))):
		print('S[%d] &' % i)
		for interval, value in zip(tint, bits):
			print('\t%g%s' % (interval, 'H' if value else 'L'), end=' ')
		print('\n\t\\\\')

if __name__=='__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument('--fname', '-f', type=str, default=None)
	parser.add_argument('--limit', '-l', type=float, default=200.0)
	args = parser.parse_args()
	main(args.fname, args.limit)

